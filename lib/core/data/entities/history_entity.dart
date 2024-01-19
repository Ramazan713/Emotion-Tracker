
import 'package:floor/floor.dart';

@Entity(
  tableName: "Histories"
)
class HistoryEntity{

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String timestamp;
  final String emotion;

  HistoryEntity({
    this.id,
    required this.timestamp,
    required this.emotion
  });
}