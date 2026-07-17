import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Post-login landing screen. Placeholder until the real home feature lands.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home')),
    );
  }
}
