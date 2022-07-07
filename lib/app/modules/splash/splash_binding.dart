

import 'package:app_music_flutter/app/modules/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => SplashController(),
  fenix: true);
  }

}