
import 'package:emotion_tracker/core/data/app_database.dart';
import 'package:emotion_tracker/core/data/repo/history_repo_impl.dart';
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:emotion_tracker/features/main/main_controller.dart';
import 'package:get/get.dart';

class MyAppDefaultBindings extends Bindings{
  final AppDatabase appDatabase;

  MyAppDefaultBindings({
    required this.appDatabase
  });


  @override
  void dependencies() {
    Get.put<HistoryRepo>(HistoryRepoImpl(historyDao: appDatabase.historyDao));

    Get.put(MainController());
  }

}