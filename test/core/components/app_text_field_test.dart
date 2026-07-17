import 'package:co_buy/core/components/atoms/app_text_field.dart';
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
  testWidgets('renders label and hint, forwards input', (tester) async {
    String? value;
    await tester.pumpWidget(
      _wrap(
        AppTextField(
          label: 'Email',
          hint: 'you@example.com',
          onChanged: (v) => value = v,
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('you@example.com'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'a@b.co');
    expect(value, 'a@b.co');
  });

  testWidgets('obscureText adds a working visibility toggle', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppTextField(label: 'Password', obscureText: true)),
    );

    EditableText editable() =>
        tester.widget<EditableText>(find.byType(EditableText));
    expect(editable().obscureText, isTrue);

    // The toggle renders SVG assets, so locate it by tooltip.
    await tester.tap(find.byTooltip('Show'));
    await tester.pump();
    expect(editable().obscureText, isFalse);

    await tester.tap(find.byTooltip('Hide'));
    await tester.pump();
    expect(editable().obscureText, isTrue);
  });

  testWidgets('shows errorText below the field', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppTextField(label: 'Email', errorText: 'Invalid email')),
    );

    expect(find.text('Invalid email'), findsOneWidget);
  });

  testWidgets('validator errors surface through Form validation', (
    tester,
  ) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      _wrap(
        Form(
          key: formKey,
          child: AppTextField(
            label: 'Name',
            validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
          ),
        ),
      ),
    );

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pump();
    expect(find.text('Required'), findsOneWidget);
  });
}
