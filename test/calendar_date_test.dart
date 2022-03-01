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

class CalendarRepository {
  List<List<DateTime>> getCalendarWeeks(
      {required int year, required int month}) {
    final firstDateOfMonth = DateTime(year, month, 1);
    final beginDateOfWeek = firstDateOfMonth.subtract(
      Duration(
        days: firstDateOfMonth.weekday % DateTime.sunday,
      ),
    );

    return List.generate(
      getCountOfWeek(year, month, beginDateOfWeek),
      (week) => generateWeek(beginDateOfWeek, week),
    );
  }

  int getCountOfWeek(int year, int month, DateTime beginDateOfWeek) {
    final firstDateOfNextMonth = DateTime(year, month + 1, 1);

    final numberOfWeek = ((firstDateOfNextMonth.millisecondsSinceEpoch -
                        beginDateOfWeek.millisecondsSinceEpoch) /
                    (24 * 60 * 60 * 1000) +
                6)
            .toInt() ~/
        7;
    return numberOfWeek;
  }

  List<DateTime> generateWeek(DateTime beginDateOfWeek, int week) {
    return List.generate(
      7,
      (day) => beginDateOfWeek.add(
        Duration(days: week * 7 + day),
      ),
    );
  }
}
