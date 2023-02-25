import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Home Page')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => pushNavigator(
              context,
              '/pages/riverpod_example_page/provider_page/provider_page',
            ),
            child: const Text('ProviderPage'),
          ),
        ],
      ),
    );
  }

  void pushNavigator(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }
}
