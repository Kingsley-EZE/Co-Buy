import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppFormatters.naira', () {
    test('groups thousands and drops decimals for whole amounts', () {
      expect(AppFormatters.naira(490000), '₦490,000');
      expect(AppFormatters.naira(1234567), '₦1,234,567');
    });

    test('keeps small amounts ungrouped', () {
      expect(AppFormatters.naira(0), '₦0');
      expect(AppFormatters.naira(999), '₦999');
    });

    test('shows two decimals for fractional amounts, grouping intact', () {
      expect(AppFormatters.naira(499.5), '₦499.50');
      expect(AppFormatters.naira(4900.5), '₦4,900.50');
    });
  });

  group('AppFormatters.deadline', () {
    test('formats weekday, day, month and 12-hour time', () {
      expect(
        AppFormatters.deadline(DateTime(2026, 7, 20, 18)),
        'Mon. 20 July 6pm',
      );
    });

    test('keeps minutes when non-zero and handles am/noon/midnight', () {
      expect(
        AppFormatters.deadline(DateTime(2026, 7, 25, 6, 30)),
        'Sat. 25 July 6:30am',
      );
      expect(
        AppFormatters.deadline(DateTime(2026, 1, 1, 0)),
        'Thu. 1 January 12am',
      );
      expect(
        AppFormatters.deadline(DateTime(2026, 1, 1, 12)),
        'Thu. 1 January 12pm',
      );
    });
  });
}
