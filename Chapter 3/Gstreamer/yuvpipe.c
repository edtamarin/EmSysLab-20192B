#include <gst/gst.h>
#include <glib.h>

static gboolean
bus_call (GstBus     *bus,
          GstMessage *msg,
          gpointer    data)
{
  GMainLoop *loop = (GMainLoop *) data;

  switch (GST_MESSAGE_TYPE (msg)) {

    case GST_MESSAGE_EOS:
      g_print ("End of stream\n");
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

/*
 * Linking camera to decoder with custom capabilities
 */
static gboolean
link_camera(GstElement *e1, GstElement *e2){
  gboolean link_ok;
  GstCaps *caps;
  // set capabilities
  caps = gst_caps_new_simple("image/jpeg",
	"format", G_TYPE_STRING, "I420",
	"width", G_TYPE_INT, 160,
	"height", G_TYPE_INT, 120,
	"framerate", GST_TYPE_FRACTION, 30,1,
	NULL);
  // link elements
  link_ok = gst_element_link_filtered(e1,e2,caps);
  gst_caps_unref(caps);
  if (!link_ok){
	g_warning("Camera link failed!");
  }
  return link_ok;
}



int
main (int   argc,
      char *argv[])
{
  GMainLoop *loop;

  GstElement *pipeline, *source, *demuxer, *decoder, *conv, *sink;
  GstBus *bus;
  guint bus_watch_id;

  /* Initialisation */
  gst_init (&argc, &argv);
  loop = g_main_loop_new (NULL, FALSE);


  /* Check input arguments */
  if (argc != 3) {
    g_printerr ("Usage: %s <video input> <yuv output file>\n", argv[0]);
    return -1;
  }

  /* Create gstreamer elements */
  pipeline = gst_pipeline_new ("yuv-storage");
  source   = gst_element_factory_make ("v4l2src",       "video-source");
  decoder   = gst_element_factory_make ("jpegdec",       "jpeg-decoder");
  sink   = gst_element_factory_make ("filesink",       "store");

  if (!pipeline || !source || !decoder || !sink) {
    g_printerr ("One element could not be created. Exiting.\n");
    return -1;
  }

  /* Set up the pipeline */

  /* we set the input filename to the source element */
  g_object_set (G_OBJECT (source), "device", argv[1], NULL);

  g_object_set (G_OBJECT (sink), "location", argv[2], NULL);

  /* we add a message handler */
  bus = gst_pipeline_get_bus (GST_PIPELINE (pipeline));
  bus_watch_id = gst_bus_add_watch (bus, bus_call, loop);
  gst_object_unref (bus);

  /* we add all elements into the pipeline */
  gst_bin_add_many (GST_BIN (pipeline),
                    source, decoder, sink, NULL);

  /* we link the elements together */
  link_camera(source,decoder); // custom camera link
  gst_element_link(decoder,sink); // generic link to sink

  /* Set the pipeline to "playing" state*/
  gst_element_set_state (pipeline, GST_STATE_PLAYING);

  /* Iterate */
  g_print ("Running...\n");
  g_main_loop_run (loop);


  /* Out of the main loop, clean up nicely */
  g_print ("Returned, stopping playback\n");
  gst_element_set_state (pipeline, GST_STATE_NULL);

  g_print ("Deleting pipeline\n");
  gst_object_unref (GST_OBJECT (pipeline));
  g_source_remove (bus_watch_id);
  g_main_loop_unref (loop);

  return 0;
}


