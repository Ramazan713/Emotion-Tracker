
abstract class EmotionNotificationService{

  final String channelKey = "emotion_channel";
  final String channelName = "emotion_channel";
  final String channelDescription = "used to determine emotion";
  final int notificationId = 7;

  Future<void> init();

  Future<bool> hasNotificationPermission();

  Future<bool> requestNotificationPermission();

  Future<bool> ifNotHasPermissionRequest();

  Future<void> scheduleEmotionNotification({required int seconds});

  Future<void> cancelSchedule();

  Future<void> handleNotificationNavigationRequest({
    Future<void> Function(String emotion)? onBefore,
    Future<void> Function(String emotion)? onAfter
  });

}