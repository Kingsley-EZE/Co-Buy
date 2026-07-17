import 'package:co_buy/core/components/atoms/app_button.dart';
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
  testWidgets('fires onPressed when tapped', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      _wrap(AppButton(label: 'Continue', onPressed: () => pressed = true)),
    );

    await tester.tap(find.text('Continue'));
    expect(pressed, isTrue);
  });

  testWidgets('null onPressed renders disabled button', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppButton(label: 'Continue', onPressed: null)),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.enabled, isFalse);
  });

  testWidgets('loading shows spinner instead of label and ignores taps', (
    tester,
  ) async {
    var pressed = false;
    await tester.pumpWidget(
      _wrap(
        AppButton(
          label: 'Continue',
          loading: true,
          onPressed: () => pressed = true,
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Continue'), findsNothing);

    await tester.tap(find.byType(AppButton), warnIfMissed: false);
    expect(pressed, isFalse);
  });

  testWidgets('outline variant has a border and no fill', (tester) async {
    await tester.pumpWidget(
      _wrap(
        AppButton(
          label: 'Cancel',
          variant: AppButtonVariant.outline,
          onPressed: () {},
        ),
      ),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final style = button.style!;
    expect(style.backgroundColor!.resolve({}), Colors.transparent);
    expect(
      style.side!.resolve({})!.color,
      AppColors.light.button.outline,
    );
  });
}
