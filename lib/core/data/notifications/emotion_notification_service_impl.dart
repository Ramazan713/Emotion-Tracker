
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:emotion_tracker/core/domain/notifications/emotion_notification_service.dart';
import 'package:emotion_tracker/core/utils/emotions_util.dart';
import 'package:emotion_tracker/features/app/my_app.dart';
import 'package:emotion_tracker/features/quote_display/presentation/quote_detail_page.dart';
import 'package:get/get.dart';

class EmotionNotificationServiceImpl extends EmotionNotificationService{

  @override
  Future<void> init() async {
    AwesomeNotifications().initialize(null,
        [
          NotificationChannel(
            enableVibration: false,
            playSound: false,
            importance: NotificationImportance.Default,
            channelKey: channelKey,
            channelName: channelName,
            channelDescription: channelDescription,
          )
        ],
        debug: true
    );
    await AwesomeNotifications().setListeners(onActionReceivedMethod: _notificationTapBackground);
  }

  @override
  Future<bool> hasNotificationPermission() async {
    return await AwesomeNotifications().isNotificationAllowed();
  }


  @override
  Future<bool> requestNotificationPermission() async {
    return await AwesomeNotifications().requestPermissionToSendNotifications(
        channelKey: channelKey,
        permissions: [NotificationPermission.Badge, NotificationPermission.Light]
    );
  }

  @override
  Future<bool> ifNotHasPermissionRequest() async{
    if(!await hasNotificationPermission()){
      return await requestNotificationPermission();
    }
    return true;
  }

  @override
  Future<void> scheduleEmotionNotification({required int seconds}) async{
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: channelKey,
          title: "How are you",
        ),
        actionButtons: [
          _getEmotionActionButton(EmotionsUtil.positiveEmotions.first),
          _getEmotionActionButton(EmotionsUtil.negativeEmotions.first),
        ],
        schedule: NotificationInterval(
            interval: seconds,
            allowWhileIdle: true,
            repeats: true,
            preciseAlarm: true
        )
    );
  }



  @override
  Future<void> cancelSchedule() async{
    await AwesomeNotifications().cancelSchedule(notificationId);
  }


  @override
  Future<void> handleNotificationNavigationRequest({
    Future<void> Function(String emotion)? onBefore,
    Future<void> Function(String emotion)? onAfter
  }) async {
    final notificationAction = await AwesomeNotifications().getInitialNotificationAction(
        removeFromActionEvents: true
    );
    if(notificationAction != null){
      final emotion = notificationAction.buttonKeyPressed;

      await onBefore?.call(emotion);
      Get.to(() => const QuoteDetailPage(), arguments: {"emotion": emotion});
      await onAfter?.call(emotion);
    }
  }

  NotificationActionButton _getEmotionActionButton(String emotion){
    return NotificationActionButton(
      key: emotion,
      label: emotion,
      actionType: ActionType.Default,
      autoDismissible: true,
    );
  }

}



@pragma('vm:entry-point')
Future<void> _notificationTapBackground(ReceivedAction notificationResponse) async {
  MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/quote_detail',
          (route) => (route.settings.name != '/quote_detail') || route.isFirst,
      arguments: {
        "emotion": notificationResponse.buttonKeyPressed
      }
  );
}