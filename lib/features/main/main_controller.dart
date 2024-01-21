
import 'package:emotion_tracker/core/domain/notifications/emotion_notification_service.dart';
import 'package:emotion_tracker/core/domain/repo/history_repo.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  late final HistoryRepo _historyRepo;
  late final EmotionNotificationService _notificationService;

  MainController({
    required HistoryRepo historyRepo,
    required EmotionNotificationService notificationService
  }){
    _historyRepo = historyRepo;
    _notificationService = notificationService;
  }

  @override
  void onInit() async {
    super.onInit();

    await _notificationService.handleNotificationNavigationRequest(
      onBefore: (emotion)async{
        insertHistory(emotion);
      }
    );
  }


  void insertHistory(String emotion) async{
    await _historyRepo.insertHistory(emotion);
  }

  Future<void> setSchedule()async{
    final bool hasPermission = await _notificationService.ifNotHasPermissionRequest();
    if(hasPermission){
      await _notificationService.cancelSchedule();
      await _notificationService.scheduleEmotionNotification(seconds: 60 * 5);
    }
  }

}