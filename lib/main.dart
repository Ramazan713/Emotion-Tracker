
import 'package:emotion_tracker/core/data/get_database.dart';
import 'package:emotion_tracker/core/data/notifications/emotion_notification_service_impl.dart';
import 'package:flutter/material.dart';
import 'features/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDatabase = await getDatabase();

  await EmotionNotificationServiceImpl().init();

  runApp(MyApp(
    appDatabase: appDatabase,
  ));
}
