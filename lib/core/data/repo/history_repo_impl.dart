
import 'package:emotion_tracker/core/data/entities/history_entity.dart';
import 'package:emotion_tracker/core/data/mapper/history_mapper.dart';
import 'package:emotion_tracker/core/data/services/history_dao.dart';
import 'package:emotion_tracker/core/domain/models/history/history.dart';
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';

class HistoryRepoImpl extends HistoryRepo{

  late final HistoryDao _historyDao;

  HistoryRepoImpl({
    required HistoryDao historyDao
  }){
    _historyDao = historyDao;
  }

  @override
  Future<List<History>> getHistories() async {
    return (await _historyDao.getHistories())
        .map((e) => e.toHistory()).toList();
  }

  @override
  Future<void> insertHistory(String emotion) async {
    final historyEntity = History(
        emotion: emotion,
        dateTime: DateTime.now()
    ).toHistoryEntity();

    await _historyDao.insertHistory(historyEntity);
  }

}