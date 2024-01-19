

import 'package:emotion_tracker/core/domain/models/history/history.dart';

abstract class HistoryRepo{

  Future<void> insertHistory(String emotion);

  Future<List<History>> getHistories();
}