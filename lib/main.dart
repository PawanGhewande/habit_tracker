import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

import 'modules/dashboard/presentation/view/dashboard_view.dart';

void main() {
  runApp(
    Provider<LocalStorage>(
      create: (_) => LocalStorage(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardView(),
    );
  }
}
