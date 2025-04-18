import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qm_flutter_proxy/http_proxy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 初始化 HttpProxy 的 Future
  final Future<HttpProxy> _httpProxyFuture = HttpProxy.createHttpProxy();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<HttpProxy>(
        future: _httpProxyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 加载中
            return Scaffold(
              appBar: AppBar(title: Text('HTTP proxy example app')),
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            // 出错了
            return Scaffold(
              appBar: AppBar(title: Text('HTTP proxy example app')),
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else if (snapshot.hasData) {
            // 成功获取数据
            final httpProxy = snapshot.data!;
            HttpOverrides.global = httpProxy;

            return Scaffold(
              appBar: AppBar(title: Text('HTTP proxy example app')),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'proxyHost: ${httpProxy.host}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'proxyPort: ${httpProxy.port}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          } else {
            // 不太可能走到这儿
            return Scaffold(
              appBar: AppBar(title: Text('HTTP proxy example app')),
              body: Center(child: Text('No data')),
            );
          }
        },
      ),
    );
  }
}
