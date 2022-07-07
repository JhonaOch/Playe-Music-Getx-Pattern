


import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:get/instance_manager.dart';

class PlayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(() => PlayerControlller);
  }


}