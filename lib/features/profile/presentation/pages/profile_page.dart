import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';

/// Profile tab. Placeholder until the real profile feature lands.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile')),
    );
  }
}
