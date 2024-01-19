import 'app_database.dart';

Future<AppDatabase> getDatabase() async {

  return await $FloorAppDatabase.databaseBuilder("appDb.db")
      .build();
}