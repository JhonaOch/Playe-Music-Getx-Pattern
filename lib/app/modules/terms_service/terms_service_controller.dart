import 'package:app_music_flutter/app/modules/home/home_page.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class TermServiceController extends GetxController {
  void aceptar() {
    Get.off(() => const HomePage(),
        transition: Transition.zoom, duration: const Duration(seconds: 1));
  }
}
