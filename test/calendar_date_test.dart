import 'package:calendar_printer/repository/calendar_repository.dart';
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

    final expected =
        '2022-03-27, 2022-03-28, 2022-03-29, 2022-03-30, 2022-03-31, 2022-04-01, 2022-04-02'
            .split(', ');

    final lastWeek = repository.getCalendarWeeks(year: 2022, month: 3).last;
    final actual =
        lastWeek.map((e) => DateFormat("yyyy-MM-dd").format(e)).toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });

  test('last week of 2021-12', () async {
    final repository = CalendarRepository();

    final expected =
        '2021-12-26, 2021-12-27, 2021-12-28, 2021-12-29, 2021-12-30, 2021-12-31, 2022-01-01'
            .split(', ');

    final lastWeek = repository.getCalendarWeeks(year: 2021, month: 12).last;
    final actual =
        lastWeek.map((e) => DateFormat("yyyy-MM-dd").format(e)).toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });

  test('first week of 2022-01', () async {
    final repository = CalendarRepository();

    final expected =
        '2021-12-26, 2021-12-27, 2021-12-28, 2021-12-29, 2021-12-30, 2021-12-31, 2022-01-01'
            .split(', ');

    final firstWeek = repository.getCalendarWeeks(year: 2022, month: 1).first;
    final actual =
        firstWeek.map((e) => DateFormat("yyyy-MM-dd").format(e)).toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });

  test('last week of 2022-12', () async {
    final repository = CalendarRepository();

    final expected =
        '2022-12-25, 2022-12-26, 2022-12-27, 2022-12-28, 2022-12-29, 2022-12-30, 2022-12-31'
            .split(', ');

    final lastWeek = repository.getCalendarWeeks(year: 2022, month: 12).last;
    final actual =
        lastWeek.map((e) => DateFormat("yyyy-MM-dd").format(e)).toList();

    assert(ListEquality().equals(expected, actual),
        'expected: [$expected] but actual: [$actual]');
  });
}
