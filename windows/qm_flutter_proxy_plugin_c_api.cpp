#include "include/qm_flutter_proxy/qm_flutter_proxy_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "qm_flutter_proxy_plugin.h"

void QmFlutterProxyPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  qm_flutter_proxy::QmFlutterProxyPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
