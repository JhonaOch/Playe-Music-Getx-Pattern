import 'package:app_music_flutter/app/modules/splash/splash_controller.dart';
import 'package:app_music_flutter/app/modules/splash/widgets/loaging_widget.dart';
import 'package:app_music_flutter/app/modules/splash/widgets/logo_widget.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemesUI theme = ThemesUI();

    return GetBuilder<SplashController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
            body: Container(
          width:double.infinity,
          height: double.infinity,
          color: theme.backgroundColor,
          child: Column(children: const [LogoPage(), LoagingPage()]),
        )),
      ),
    );
  }
}
