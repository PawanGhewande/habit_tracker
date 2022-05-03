import 'package:flutter/cupertino.dart';

class AddHabitController extends ChangeNotifier {
  List<bool> values = [false, false, false, false, false, false, false];

  onChange(int day) {
    values[day - 1] = !values[day - 1];

    notifyListeners();
  }
}
