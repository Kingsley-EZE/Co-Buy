import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/pool_summary_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final filledState = CreatePoolFormState(
    title: 'Mama Gold rice 50kg — 10 bags',
    description: "Landlord's 80th birthday is coming up.",
    category: const PoolCategory(
      id: '1e9d8011-cb58-4e96-a568-547c763413df',
      name: 'BulkPurchase',
      description: 'Bulk purchase — rice, gas, building materials, groceries',
    ),
    evenContribution: true,
    targetAmount: '500000',
    slots: '10',
    deadline: DateTime(2026, 7, 20, 18),
    bank: const Bank(name: 'Zenith Bank', code: '057'),
    accountNumber: '2210045501',
  );

  Widget wrap(CreatePoolFormState state, {VoidCallback? onCreatePool}) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () => PoolSummarySheet.show(
                context,
                formState: state,
                onCreatePool: onCreatePool ?? () {},
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openSheet(WidgetTester tester) async {
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('renders every entered detail with derived amounts', (
    tester,
  ) async {
    await tester.pumpWidget(wrap(filledState));
    await openSheet(tester);

    expect(find.text('Pool Summary'), findsOneWidget);
    expect(find.text('Mama Gold rice 50kg — 10 bags'), findsOneWidget);
    expect(find.text("Landlord's 80th birthday is coming up."), findsOneWidget);
    expect(find.text('Bulk Purchase'), findsOneWidget);
    expect(find.text('Equal slot'), findsOneWidget);
    expect(find.text('₦500,000'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('Platform fee (2%)'), findsOneWidget);
    expect(find.text('₦10,000'), findsOneWidget);
    expect(find.text('Mon. 20 July 6pm'), findsOneWidget);
    expect(find.text('Zenith Bank'), findsOneWidget);
    expect(find.text('2210045501'), findsOneWidget);
    expect(find.text('₦490,000'), findsOneWidget);
  });

  testWidgets('Create pool closes the sheet and fires the callback', (
    tester,
  ) async {
    var created = false;
    await tester.pumpWidget(
      wrap(filledState, onCreatePool: () => created = true),
    );
    await openSheet(tester);

    // The sheet is taller than the test viewport, so bring the CTA on-screen.
    await tester.ensureVisible(find.text('Create pool'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Create pool'));
    await tester.pumpAndSettle();

    expect(created, isTrue);
    expect(find.text('Pool Summary'), findsNothing);
  });

  testWidgets('Edit details closes the sheet without creating', (tester) async {
    var created = false;
    await tester.pumpWidget(
      wrap(filledState, onCreatePool: () => created = true),
    );
    await openSheet(tester);

    await tester.ensureVisible(find.text('Edit details'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit details'));
    await tester.pumpAndSettle();

    expect(created, isFalse);
    expect(find.text('Pool Summary'), findsNothing);
  });

  testWidgets('the close button dismisses the sheet', (tester) async {
    await tester.pumpWidget(wrap(filledState));
    await openSheet(tester);

    // The close icon is the sheet's only SVG (the ic_close asset).
    await tester.tap(find.byType(SvgPicture));
    await tester.pumpAndSettle();

    expect(find.text('Pool Summary'), findsNothing);
  });
}
