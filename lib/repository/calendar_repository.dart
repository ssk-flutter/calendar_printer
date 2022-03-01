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
      _getCountOfWeek(year, month, beginDateOfWeek),
      (week) => _generateWeek(beginDateOfWeek, week),
    );
  }

  int _getCountOfWeek(int year, int month, DateTime beginDateOfWeek) {
    final firstDateOfNextMonth = DateTime(year, month + 1, 1);

    final numberOfWeek = ((firstDateOfNextMonth.millisecondsSinceEpoch -
                        beginDateOfWeek.millisecondsSinceEpoch) /
                    (24 * 60 * 60 * 1000) +
                6)
            .toInt() ~/
        7;
    return numberOfWeek;
  }

  List<DateTime> _generateWeek(DateTime beginDateOfWeek, int week) {
    return List.generate(
      7,
      (day) => beginDateOfWeek.add(
        Duration(days: week * 7 + day),
      ),
    );
  }
}
