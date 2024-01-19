
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  late final HistoryRepo _historyRepo;

  MainController({
    required HistoryRepo historyRepo
  }){
    _historyRepo = historyRepo;
  }

  void insertHistory(String emotion) async{
    await _historyRepo.insertHistory(emotion);
  }

}