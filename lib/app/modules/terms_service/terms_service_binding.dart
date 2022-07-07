

import 'package:app_music_flutter/app/modules/terms_service/terms_service_controller.dart';
import 'package:get/instance_manager.dart';

class TermServiceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TermServiceController()
    ,fenix: true);
  }

}