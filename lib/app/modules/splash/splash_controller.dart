import 'package:app_music_flutter/app/data/repositories/local/storage_repository.dart';
import 'package:app_music_flutter/app/modules/home/home_page.dart';
import 'package:app_music_flutter/app/modules/terms_service/terms_service_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  StorageRepository local = StorageRepository();
  

  @override
  void onReady() {
    super.onReady();
  
    getData();
  
  }

  //Get data the local storage
  Future<String?> getData() async {
    String? data = await local.session;
    if (data != null) {
      await Future.delayed(
        const Duration(seconds: 4),
        () {
          Get.off(() => const HomePage(),
              transition: Transition.zoom,
              duration: const Duration(seconds: 1));
        },
      );
      return data;
    }

    await Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.off(() => const TermServicePage(),
            transition: Transition.zoom, duration: const Duration(seconds: 1));
      },
    );

    return data;
  }
}
