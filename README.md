# qm_flutter_proxy

This plugin comes from the plugin http_proxy, only the Android part has been upgraded. It can automatically get the proxy settings of mobile devices and set the proxy for dio.

---

## How to use

**1.Dio used**

```
HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    var proxyHost = httpProxy.host;
    var proxyPort = httpProxy.port;
    if (proxyHost == null) return;
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return "PROXY $proxyHost:$proxyPort";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
        return client;
      },
    );
```


**2.Dio not used**

You should initialize before runapp().

```
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    HttpOverrides.global=httpProxy;
    runApp(MyApp());
  }
```
