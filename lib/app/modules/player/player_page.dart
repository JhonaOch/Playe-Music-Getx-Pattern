import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/modules/player/widgets/artist_widgets.dart';
import 'package:app_music_flutter/app/modules/player/widgets/bottom_logo_widgets.dart';
import 'package:app_music_flutter/app/modules/player/widgets/buttons_widgets.dart';
import 'package:app_music_flutter/app/modules/player/widgets/logo_widgets.dart';
import 'package:app_music_flutter/app/modules/player/widgets/slider_widgets.dart';
import 'package:app_music_flutter/app/modules/player/widgets/title_widgets.dart';

import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemesUI theme = ThemesUI();
    final Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
      ),
      body: GetBuilder<PlayerControlller>(
        init: PlayerControlller(),
        builder: (playerController) => SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/imgs/fondo4.jpg'),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const LogoWidgets(),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  TitleWidgets(
                    playerController: playerController,
                  ),
                  SizedBox(height: responsive.hp(1)),
                  ArtistWidgets(playerController: playerController),
                  SizedBox(height: responsive.hp(2)),
                  SliderWidgets(playerController: playerController),
                  ButtonsWidgets(playerController: playerController),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  const BottomLogoWidgets()
                ],
              )),
        ),
      ),
    );
  }
}
