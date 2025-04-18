#ifndef FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_
#define FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _QmFlutterProxyPlugin QmFlutterProxyPlugin;
typedef struct {
  GObjectClass parent_class;
} QmFlutterProxyPluginClass;

FLUTTER_PLUGIN_EXPORT GType qm_flutter_proxy_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void qm_flutter_proxy_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_
