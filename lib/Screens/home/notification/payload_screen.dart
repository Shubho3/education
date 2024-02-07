import 'package:flutter/material.dart';

class PayloadScreen extends StatelessWidget {
  const PayloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payload'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Payload Screen'),
      ),
    );
  }
}
