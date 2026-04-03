import 'package:now/now.dart';
import 'package:test/test.dart';

void main() {
  group('DateTime formatting', () {
    test('formats common tokens predictably', () {
      final date = DateTime.utc(2026, 4, 3, 9, 8, 7, 6);

      expect(
        date.format('YYYY-MM-DD HH:mm:ss.SSS ZZ'),
        '2026-04-03 09:08:07.006 +0000',
      );
    });
  });

  group('Duration extensions', () {
    test('converts integers to weeks and reads week counts', () {
      expect(2.weeks, const Duration(days: 14));
      expect(const Duration(days: 7).inWeeks, 1);
    });
  });

  group('DateTime helpers', () {
    test('supports utc conversion and comparison helpers', () {
      final local = DateTime(2026, 4, 3, 9, 8, 7);
      final later = local + const Duration(days: 1);

      expect(local.utc.isUtc, isTrue);
      expect(local < later, isTrue);
      expect(later.isAfterOrEqual(local), isTrue);
      expect(local.isNotEqual(later), isTrue);
    });
  });
}
