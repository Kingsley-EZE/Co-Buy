// Basic smoke test for the flavor-aware app shell.

import 'package:co_buy/app/app.dart';
import 'package:co_buy/core/config/app_config.dart';
import 'package:co_buy/core/config/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Configuration must be initialised before the app widget is built.
    AppConfig.init(Flavor.prod);

    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
