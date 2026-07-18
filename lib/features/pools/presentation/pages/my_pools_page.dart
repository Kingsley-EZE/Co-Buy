import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';

/// My pools tab. Placeholder until the real pools feature lands.
class MyPoolsPage extends StatelessWidget {
  const MyPoolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('My pools')),
      body: const Center(child: Text('My pools')),
    );
  }
}
