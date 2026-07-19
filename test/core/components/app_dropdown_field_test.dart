import 'package:co_buy/core/components/atoms/app_dropdown_field.dart';
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
  const fruits = ['Apple', 'Banana', 'Cherry'];

  testWidgets('renders label and hint, forwards the picked item', (
    tester,
  ) async {
    String? picked;
    await tester.pumpWidget(
      _wrap(
        AppDropdownField<String>(
          label: 'Fruit',
          hint: 'Select a fruit',
          items: fruits,
          onChanged: (v) => picked = v,
        ),
      ),
    );

    expect(find.text('Fruit'), findsOneWidget);
    expect(find.text('Select a fruit'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Banana').last);
    await tester.pumpAndSettle();

    expect(picked, 'Banana');
    expect(find.text('Banana'), findsOneWidget);
  });

  testWidgets('itemLabel controls the rendered text', (tester) async {
    await tester.pumpWidget(
      _wrap(
        AppDropdownField<int>(
          items: const [1, 2],
          itemLabel: (n) => 'Option $n',
          value: 2,
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.text('Option 2'), findsOneWidget);
  });

  testWidgets('enabled: false ignores taps and keeps the menu closed', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        AppDropdownField<String>(
          hint: 'Select a fruit',
          items: fruits,
          enabled: false,
          onChanged: (_) {},
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();

    // The menu never opened, so no item labels are on screen.
    expect(find.text('Apple'), findsNothing);
  });

  testWidgets('shows errorText below the field', (tester) async {
    await tester.pumpWidget(
      _wrap(
        AppDropdownField<String>(
          label: 'Fruit',
          items: fruits,
          errorText: 'Pick a fruit',
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.text('Pick a fruit'), findsOneWidget);
  });

  testWidgets('validator errors surface through Form validation', (
    tester,
  ) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      _wrap(
        Form(
          key: formKey,
          child: AppDropdownField<String>(
            label: 'Fruit',
            items: fruits,
            validator: (v) => v == null ? 'Required' : null,
            onChanged: (_) {},
          ),
        ),
      ),
    );

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pump();
    expect(find.text('Required'), findsOneWidget);
  });

  group('canSearch', () {
    testWidgets('tapping the field opens a sheet with every item', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            label: 'Fruit',
            hint: 'Select a fruit',
            items: fruits,
            canSearch: true,
            onChanged: (_) {},
          ),
        ),
      );

      // No Material menu in search mode.
      expect(find.byType(DropdownButtonFormField<String>), findsNothing);

      await tester.tap(find.text('Select a fruit'));
      await tester.pumpAndSettle();

      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Cherry'), findsOneWidget);
    });

    testWidgets('typing filters the list case-insensitively', (tester) async {
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            hint: 'Select a fruit',
            items: fruits,
            canSearch: true,
            onChanged: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Select a fruit'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).last, 'ban');
      await tester.pumpAndSettle();

      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Apple'), findsNothing);
      expect(find.text('Cherry'), findsNothing);
    });

    testWidgets('shows an empty state when nothing matches', (tester) async {
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            hint: 'Select a fruit',
            items: fruits,
            canSearch: true,
            onChanged: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Select a fruit'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).last, 'zzz');
      await tester.pumpAndSettle();

      expect(find.text('No matches'), findsOneWidget);
    });

    testWidgets('picking an item closes the sheet and forwards it', (
      tester,
    ) async {
      String? picked;
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            hint: 'Select a fruit',
            items: fruits,
            canSearch: true,
            onChanged: (v) => picked = v,
          ),
        ),
      );

      await tester.tap(find.text('Select a fruit'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Banana'));
      await tester.pumpAndSettle();

      expect(picked, 'Banana');
      // The sheet is gone; only the field's own value text remains.
      expect(find.text('Apple'), findsNothing);
    });

    testWidgets('renders the selected value in the field', (tester) async {
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            items: fruits,
            value: 'Cherry',
            canSearch: true,
            onChanged: (_) {},
          ),
        ),
      );

      expect(find.text('Cherry'), findsOneWidget);
    });

    testWidgets('enabled: false ignores taps and keeps the sheet closed', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          AppDropdownField<String>(
            hint: 'Select a fruit',
            items: fruits,
            canSearch: true,
            enabled: false,
            onChanged: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Select a fruit'));
      await tester.pumpAndSettle();

      expect(find.text('Apple'), findsNothing);
    });
  });
}
