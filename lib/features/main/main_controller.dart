
import 'package:emotion_tracker/core/domain/notifications/emotion_notification_service.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  late final EmotionNotificationService _notificationService;

  MainController({
    required EmotionNotificationService notificationService
  }){
    _notificationService = notificationService;
  }

  @override
  void onInit() async {
    super.onInit();

    await _notificationService.handleNotificationNavigationRequest();
  }

  Future<void> setSchedule()async{
    final bool hasPermission = await _notificationService.ifNotHasPermissionRequest();
    if(hasPermission){
      await _notificationService.cancelSchedule();
      await _notificationService.scheduleEmotionNotification(seconds: 60 * 5);
    }
  }

}