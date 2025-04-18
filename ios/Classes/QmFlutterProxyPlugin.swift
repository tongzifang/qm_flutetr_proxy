import Flutter
import UIKit
import CFNetwork

public class QmFlutterProxyPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "qm_flutter_proxy", binaryMessenger: registrar.messenger())
        let instance = QmFlutterProxyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getProxyHost":
            if let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
               let httpEnable = proxySettings["HTTPEnable"] as? Int,
               httpEnable == 1,
               let proxyHost = proxySettings["HTTPProxy"] as? String {
                result(proxyHost)
            } else {
                result(nil)
            }

        case "getProxyPort":
            if let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
               let httpEnable = proxySettings["HTTPEnable"] as? Int,
               httpEnable == 1,
               let proxyPort = proxySettings["HTTPPort"] as? Int {
                result(String(proxyPort))
            } else {
                result(nil)
            }
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
