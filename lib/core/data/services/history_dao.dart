
import 'package:emotion_tracker/core/data/entities/history_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class HistoryDao{

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertHistory(HistoryEntity history);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateHistory(HistoryEntity history);

  @Query("""
    select * from histories order by id desc
  """)
  Future<List<HistoryEntity>> getHistories();
}