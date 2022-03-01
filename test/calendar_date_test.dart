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

  test('first week of 2022-01', () async {
    final repository = CalendarRepository();

    final expected = ['2021-12-30', '2021-12-31', '2022-01-01'];

    final firstWeek = repository.getCalendarWeeks(year: 2022, month: 1).first;
    final actual = firstWeek
        .sublist(4)
        .map((e) => DateFormat("yyyy-MM-dd").format(e))
        .toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });
}

class CalendarRepository {
  List<List<DateTime>> getCalendarWeeks(
      {required int year, required int month}) {
    final beginDay = DateTime(year, month, 1);
    // monday/1 to sunday/7
    final beforeDays = beginDay.weekday;

    final firstWeek = List.generate(beforeDays,
            (index) => beginDay.subtract(Duration(days: beforeDays - index))) +
        List.generate(
            DateTime.sunday - beginDay.weekday,
            (index) => beginDay.add(
                  Duration(days: index),
                ));
    return [
      firstWeek,
    ];
  }
}
