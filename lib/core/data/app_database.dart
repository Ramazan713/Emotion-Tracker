

import 'dart:async';

import 'package:emotion_tracker/core/data/entities/history_entity.dart';
import 'package:emotion_tracker/core/data/services/history_dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(
    version: 1,
    entities: [HistoryEntity]
)
abstract class AppDatabase extends FloorDatabase{

  HistoryDao get historyDao;
}