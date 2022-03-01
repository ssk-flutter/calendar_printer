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
      _getNumberOfWeek(year, month, beginDateOfWeek),
      (week) => _generateWeek(beginDateOfWeek, week),
    );
  }

  int _getNumberOfWeek(int year, int month, DateTime beginDateOfWeek) {
    final firstDateOfNextMonth = DateTime(year, month + 1, 1);

    final durationOfCalendarVisible =
        firstDateOfNextMonth.millisecondsSinceEpoch -
            beginDateOfWeek.millisecondsSinceEpoch;
    final aDay = Duration(days: 1).inMilliseconds;
    final result = ((durationOfCalendarVisible / aDay) + 6).toInt() ~/ 7;
    return result;
  }

  List<DateTime> _generateWeek(DateTime beginDateOfWeek, int week) {
    return List.generate(
      7,
      (day) => beginDateOfWeek.add(Duration(days: week * 7 + day)),
    );
  }
}
