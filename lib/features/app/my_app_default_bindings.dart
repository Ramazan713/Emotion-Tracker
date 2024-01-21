
import 'package:emotion_tracker/core/data/app_database.dart';
import 'package:emotion_tracker/core/data/notifications/emotion_notification_service_impl.dart';
import 'package:emotion_tracker/core/data/repo/history_repo_impl.dart';
import 'package:emotion_tracker/core/domain/notifications/emotion_notification_service.dart';
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:emotion_tracker/features/history/history_controller.dart';
import 'package:emotion_tracker/features/main/main_controller.dart';
import 'package:emotion_tracker/features/quote_display/data/repo/quote_repo_impl.dart';
import 'package:emotion_tracker/features/quote_display/data/services/quote_download_service_impl.dart';
import 'package:emotion_tracker/features/quote_display/data/services/wikipedia_quote_download_image_service.dart';
import 'package:emotion_tracker/features/quote_display/domain/repo/quote_repo.dart';
import 'package:emotion_tracker/features/quote_display/domain/services/quote_download_image_service.dart';
import 'package:emotion_tracker/features/quote_display/domain/services/quote_download_service.dart';
import 'package:get/get.dart';

import '../quote_display/presentation/quote_detail_controller.dart';

class MyAppDefaultBindings extends Bindings{
  final AppDatabase appDatabase;

  MyAppDefaultBindings({
    required this.appDatabase
  });


  @override
  void dependencies() {
    Get.put<QuoteDownloadService>(QuoteDownloadServiceImpl());
    Get.put<QuoteDownloadImageUrlService>(WikipediaQuoteDownloadImageUrlService());
    Get.put<EmotionNotificationService>(EmotionNotificationServiceImpl());

    Get.put<HistoryRepo>(HistoryRepoImpl(historyDao: appDatabase.historyDao));
    Get.put<HistoryRepo>(HistoryRepoImpl(historyDao: appDatabase.historyDao));
    Get.put<QuoteRepo>(QuoteRepoImpl(downloadService: Get.find()));

    Get.put(MainController(
        historyRepo: Get.find(),
        notificationService: Get.find()
    ));
    Get.lazyPut(() => HistoryController(historyRepo: Get.find()), fenix: true);
    Get.lazyPut(() => QuoteDetailController(
        quoteRepo: Get.find(),
        downloadImageUrlService: Get.find()
    ), fenix: true);
  }

}