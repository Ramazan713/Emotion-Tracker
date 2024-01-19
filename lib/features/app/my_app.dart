import 'package:emotion_tracker/core/data/app_database.dart';
import 'package:emotion_tracker/features/app/my_app_default_bindings.dart';
import 'package:emotion_tracker/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final AppDatabase appDatabase;

  const MyApp({
    super.key,
    required this.appDatabase
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      initialBinding: MyAppDefaultBindings(
          appDatabase: appDatabase
      ),
      home: const MainPage(),
    );
  }
}
