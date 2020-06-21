#include <gst/gst.h>
#include <glib.h>

static gboolean
bus_call (GstBus *bus, GstMessage *msg, gpointer data)
{
  GMainLoop *loop = (GMainLoop *) data;

  switch (GST_MESSAGE_TYPE (msg)) {

    case GST_MESSAGE_EOS:
      g_print ("End of recording\n");
      g_main_loop_quit (loop);
      break;

    case GST_MESSAGE_ERROR: {
      gchar  *debug;
      GError *error;

      gst_message_parse_error (msg, &error, &debug);
      g_free (debug);

      g_printerr ("Error: %s\n", error->message);
      g_error_free (error);

      g_main_loop_quit (loop);
      break;
    }
    default:
      break;
  }

  return TRUE;
}

int main (int argc, char *argv[])
{
  GMainLoop *loop;

  GstElement *pipeline, *capture, *changescale, *filter, *filesink;
  GstBus *bus;
  GstCaps *cap;
  GstCaps *app_cap;
  guint bus_watch_id;

  /* Set V4L2 device to grab from. */
  char * v4l2dev = "/dev/video0";
  int * buffersize = (int*) 300;

  /* Initialisation */
  gst_init (&argc, &argv);

  loop = g_main_loop_new (NULL, FALSE);

  /* Check input arguments */
  if (argc != 2) {
    g_printerr ("Usage: %s <Name of output file>\n", argv[0]);
    return -1;
  }

  /* Create caps */
  cap = gst_caps_new_simple ("video/x-raw",
         "width", G_TYPE_INT, 640,
         "height", G_TYPE_INT, 480,
         NULL);
  app_cap = cap;
  g_printerr ("Caps created.\n");

  /*  Implement: gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoscale ! video/x-raw,width=160,height=120,framerate=30/1 ! filesink location=file.yuv 
      Player: mplayer -demuxer rawvideo -rawvideo w=160:h=120:format=i420 file.yuv
  */

  /* Create gstreamer elements */
  pipeline    = gst_pipeline_new ("videorecorder");
  capture     = gst_element_factory_make ("v4l2src",    "video4linux2");
  changescale = gst_element_factory_make ("videoscale", "video scaler");
  filter      = gst_element_factory_make ("capsfilter", "filter");
  filesink    = gst_element_factory_make ("filesink",   "using output file as sink");

  if (!pipeline || !capture || !changescale || !filter || !filesink) {
    g_printerr("One element could not be created. Exiting.\n");
    return -1;
  }
  else 
  {
    g_printerr("Elements initialized\n");
  }

  /* Set up the pipeline */
  g_printerr("Setting up the pipeline..\n");

  /* we add a message handler */
  bus = gst_pipeline_get_bus (GST_PIPELINE (pipeline));
  bus_watch_id = gst_bus_add_watch (bus, bus_call, loop);
  gst_object_unref (bus);

  /* we add all elements into the pipeline */
  /* capture | changescale | filter | filesink */
  gst_bin_add_many (GST_BIN (pipeline), capture, changescale, filter, filesink, NULL);
  gst_element_link_many(capture, changescale, filter, filesink, NULL);

  g_printerr("Added and linking all the elements into the pipeline\n");

  /* we set the input filename to the source element */
  g_object_set (G_OBJECT (filesink), "location", argv[1], NULL);
  g_object_set (capture, "device", v4l2dev, "num-buffers", buffersize, NULL);
  g_object_set (filter, "caps", app_cap, NULL);
  gst_caps_unref (app_cap);
  g_printerr("Device, file location and maximum number of buffers objects set\n");

  g_print ("Creating output file: %s\n", argv[1]);
  gst_element_set_state (pipeline, GST_STATE_PLAYING);

  /* Iterate */
  g_print ("Starting recording...\n");
  g_main_loop_run (loop);

  /* Out of the main loop, clean up nicely */
  g_print ("Returned, stopping recording\n");
  gst_element_set_state (pipeline, GST_STATE_NULL);

  g_print ("Clearing pipeline\n");
  gst_object_unref (GST_OBJECT (pipeline));
  g_source_remove (bus_watch_id);
  g_main_loop_unref (loop);

  g_print("Terminating program\n");
  return 0;
}

