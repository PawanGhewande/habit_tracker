import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {
  late final LocalStorage _storage;

  BuildContext context;

  DashboardController(this.context) {
    _storage = Provider.of<LocalStorage>(context, listen: false);
  }

  Future<List<HabitData>> getHabits() async {
    return await _storage.getHabits(DateTime.now());
  }

  Color? get randomColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)]
          [Random().nextInt(9) * 100];
}
