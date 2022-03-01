import 'package:flutter/foundation.dart';

class DateControllerViewModel with ChangeNotifier {
  DateControllerViewModel() : super() {}

  int _month = DateTime.now().month;

  int get month => _month;

  set month(int month) {
    _month = month;
    notifyListeners();
  }

  int _year = DateTime.now().year;
  int get year => _year;

  set year(int year) {
    _year = year;
    notifyListeners();
  }

  List<int> get yearArray => year
      .toString()
      .padLeft(4, '0')
      .split('')
      .map((e) => int.parse(e))
      .toList(growable: false);

  set yearArray(List<int> yearArray) {
    year = int.parse(yearArray.map((e) => e.toString()).join(''));
  }

  void reset() {
    year = DateTime.now().year;
    month = DateTime.now().month;
  }

  void onChangeYearNumber(int index, int value) {
    final result = yearArray..[index] = value;
    yearArray = result;
  }

  void onChangeMonth(int value) {
    month = value;
  }
}
