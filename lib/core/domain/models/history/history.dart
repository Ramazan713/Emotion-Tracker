

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'history.freezed.dart';

@freezed
class History with _$History{
  const factory History({
    int? id,
    required String emotion,
    required DateTime dateTime
  }) = _History;
}