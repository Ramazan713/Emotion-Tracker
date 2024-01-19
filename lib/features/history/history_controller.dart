
import 'package:emotion_tracker/core/domain/models/history/history.dart';
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController{
  late final HistoryRepo _historyRepo;

  HistoryController({
    required HistoryRepo historyRepo
  }){
    _historyRepo = historyRepo;
  }

  final histories = <History>[].obs;

  @override
  void onInit() async{
    super.onInit();

    histories.value = await _historyRepo.getHistories();
  }
}