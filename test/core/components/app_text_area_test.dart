import 'package:co_buy/core/components/common/app_text_area.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('counter tracks the text length live', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrap(
        AppTextArea(
          label: 'Description',
          controller: controller,
          maxLength: 200,
        ),
      ),
    );

    expect(find.text('0/200'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Hello');
    await tester.pump();

    expect(find.text('5/200'), findsOneWidget);
  });

  testWidgets('input is capped at maxLength and forwarded via onChanged', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    String? value;

    await tester.pumpWidget(
      _wrap(
        AppTextArea(
          controller: controller,
          maxLength: 5,
          onChanged: (v) => value = v,
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'overflowing');
    await tester.pump();

    expect(value, 'overf');
    expect(find.text('5/5'), findsOneWidget);
  });
}
