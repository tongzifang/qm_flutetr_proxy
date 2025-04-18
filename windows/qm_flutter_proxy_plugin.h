#ifndef FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_
#define FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace qm_flutter_proxy {

class QmFlutterProxyPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  QmFlutterProxyPlugin();

  virtual ~QmFlutterProxyPlugin();

  // Disallow copy and assign.
  QmFlutterProxyPlugin(const QmFlutterProxyPlugin&) = delete;
  QmFlutterProxyPlugin& operator=(const QmFlutterProxyPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace qm_flutter_proxy

#endif  // FLUTTER_PLUGIN_QM_FLUTTER_PROXY_PLUGIN_H_
