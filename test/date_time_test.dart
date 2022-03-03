import 'package:flutter_test/flutter_test.dart';

void main() {
  test('end day of month', () async {
    assert(DateTime(2022, 3, 31) == DateTime(2022, 4, 0));
  });

  test('the last day of year', () async {
    assert(DateTime(2022, 12, 31) == DateTime(2022, 13, 0));
  });

  test('the last day of year', () async {
    assert(DateTime(2022, 12, 31) == DateTime(2023, 1, 0));
  });

  test('the first day of year', () async {
    assert(DateTime(2023, 1, 1) == DateTime(2022, 13, 1));
  });

  test('the first day of zero month', () async {
    assert(DateTime(2022, 12, 1) == DateTime(2023, 0, 1));
  });

  test('negative month', () async {
    assert(DateTime(2022, 11, 1) == DateTime(2023, -1, 1));
  });

  test('negative day', () async {
    assert(DateTime(2022, 10, 30) == DateTime(2022, 11, -1));
  });
}
