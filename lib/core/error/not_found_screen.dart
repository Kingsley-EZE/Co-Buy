import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Fallback for unmatched or malformed locations (GoRouter `errorBuilder`).
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(
        child: Text('404 — ${error ?? 'Page not found'}'),
      ),
    );
  }
}
