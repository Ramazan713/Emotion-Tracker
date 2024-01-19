

import 'package:emotion_tracker/core/data/entities/history_entity.dart';
import 'package:emotion_tracker/core/domain/models/history/history.dart';

extension HistoryEntityExt on HistoryEntity{
  History toHistory(){
    return History(
      id: id,
      emotion: emotion,
      dateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp))
    );
  }
}

extension HistoryExt on History{
  HistoryEntity toHistoryEntity(){
    return HistoryEntity(
        id: id,
        emotion: emotion,
        timestamp: dateTime.millisecondsSinceEpoch.toString()
    );
  }
}