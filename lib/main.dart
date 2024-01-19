import 'package:emotion_tracker/core/data/get_database.dart';
import 'package:flutter/material.dart';

import 'features/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDatabase = await getDatabase();

  runApp(MyApp(
    appDatabase: appDatabase,
  ));
}
