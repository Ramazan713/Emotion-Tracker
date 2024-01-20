import 'dart:math';

import 'package:emotion_tracker/features/quote_display/data/utils/quote_utils.dart';
import 'package:emotion_tracker/features/quote_display/domain/models/quote_model.dart';
import 'package:emotion_tracker/features/quote_display/domain/services/quote_download_service.dart';

import '../../domain/repo/quote_repo.dart';

class QuoteRepoImpl extends QuoteRepo{

  late final QuoteDownloadService _downloadService;
  QuoteRepoImpl({
    required QuoteDownloadService downloadService
  }){
    _downloadService = downloadService;
  }

  @override
  Future<QuoteModel> getRandomQuote(String emotion) async {
    final results = await _downloadService.downloadQuotes(emotion);

    if(results.isEmpty){
      return QuoteUtil.defaultQuotes[emotion] ?? QuoteUtil.defaultQuotes.values.first;
    }

    final index = Random().nextInt(results.length);
    return results[index];
  }

}