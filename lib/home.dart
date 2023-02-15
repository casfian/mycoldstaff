import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MYCOLD STAFF APP'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
