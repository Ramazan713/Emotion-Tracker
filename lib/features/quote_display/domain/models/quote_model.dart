

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'quote_model.freezed.dart';

@freezed
class QuoteModel with _$QuoteModel{
  const factory QuoteModel({
    required String content,
    required String author
  }) = _QuoteModel;
}