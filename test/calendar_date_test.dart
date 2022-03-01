import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('first week of 2022-03', () async {
    final repository = CalendarRepository();

    final expected = ['2022-02-27', '2022-02-28', '2022-03-01', '2022-03-02'];

    final firstWeek = repository.getCalendarWeeks(year: 2022, month: 3).first;
    final actual = firstWeek
        .take(4)
        .map((e) => DateFormat("yyyy-MM-dd").format(e))
        .toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });

  test('last week of 2022-03', () async {
    final repository = CalendarRepository();

    final expected = ['2022-03-30', '2022-03-31', '2022-04-01', '2022-04-02'];

    final lastWeek = repository.getCalendarWeeks(year: 2022, month: 3).last;
    final actual = lastWeek
        .sublist(3)
        .map((e) => DateFormat("yyyy-MM-dd").format(e))
        .toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });
}

class CalendarRepository {
  List<List<DateTime>> getCalendarWeeks(
      {required int year, required int month}) {
    return [
      [
        DateTime(year, 2, 27),
        DateTime(year, 2, 28),
        DateTime(year, 3, 1),
        DateTime(year, 3, 2),
        DateTime(year, 3, 3),
        DateTime(year, 3, 4),
        DateTime(year, 3, 5),
      ],
      [
        DateTime(year, 3, 27),
        DateTime(year, 3, 28),
        DateTime(year, 3, 29),
        DateTime(year, 3, 30),
        DateTime(year, 3, 31),
        DateTime(year, 4, 1),
        DateTime(year, 4, 2),
      ],
    ];
  }
}
