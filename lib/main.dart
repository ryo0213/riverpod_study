import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_home_page.dart';
import 'pages/riverpod_example_page/provider_page/provider_page.dart';

// final myProvider = Provider<MyValue>(((ref) {
//   return MyValue();
// }));

// final myProvider = Provider(
//   (ref) => MyValue(),
// );

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(),
        '/pages/riverpod_example_page/provider_page/provider_page': (BuildContext context) => const ProviderPage(),
      },
    );
  }
}
