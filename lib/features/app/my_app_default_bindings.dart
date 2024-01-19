
import 'package:emotion_tracker/features/main/main_controller.dart';
import 'package:get/get.dart';

class MyAppDefaultBindings extends Bindings{


  @override
  void dependencies() {
    Get.put(MainController());
  }

}