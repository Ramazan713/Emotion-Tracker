

import 'package:emotion_tracker/core/utils/date_time_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'history.freezed.dart';

@freezed
class History with _$History{
  const History._();

  const factory History({
    int? id,
    required String emotion,
    required DateTime dateTime
  }) = _History;

  String get formattedDate => DateTimeUtil.getFormattedDate(dateTime);
}