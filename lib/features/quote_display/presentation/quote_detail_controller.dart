
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:emotion_tracker/features/quote_display/domain/models/quote_model.dart';
import 'package:emotion_tracker/features/quote_display/domain/repo/quote_repo.dart';
import 'package:get/get.dart';

import '../domain/services/quote_download_image_service.dart';

class QuoteDetailController extends GetxController{
  late final QuoteRepo _quoteRepo;
  late final HistoryRepo _historyRepo;
  late final QuoteDownloadImageUrlService _downloadImageUrlService;

  QuoteDetailController({
    required QuoteRepo quoteRepo,
    required HistoryRepo historyRepo,
    required QuoteDownloadImageUrlService downloadImageUrlService
  }){
    _quoteRepo = quoteRepo;
    _historyRepo = historyRepo;
    _downloadImageUrlService = downloadImageUrlService;
  }

  final helloText = "".obs;
  final imgLink = "".obs;
  final quote = Rxn<QuoteModel>();
  final isLoading = true.obs;

  @override
  void onInit() async{
    super.onInit();

    final String emotion;
    if(Get.arguments is Map<String,String>){
      emotion = Get.arguments["emotion"] ?? "joy";
    }else{
      emotion = "joy";
    }

    isLoading.value = true;
    await _historyRepo.insertHistory(emotion);
    final quote = await _quoteRepo.getRandomQuote(emotion);
    this.quote.value = quote;

    imgLink.value = (await _downloadImageUrlService.getImageLink(quote.author)) ?? "";
    isLoading.value = false;
  }
}