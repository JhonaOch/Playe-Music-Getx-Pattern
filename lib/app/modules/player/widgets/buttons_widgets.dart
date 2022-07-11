import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';

class ButtonsWidgets extends StatelessWidget {
  final PlayerControlller playerController;
  const ButtonsWidgets({Key? key, required this.playerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              playerController.previus(
                  context, playerController.player!, playerController.song!);
            },
            icon: Icon(
              Icons.skip_previous,
              color: theme.textColor,
              size: responsive.hp(5),
            )),
        IconButton(
            onPressed: () {
              if (playerController.validate == false) {
                playerController.pause(playerController.player!);
              } else {
                playerController.play(playerController.player!);
              }
            },
            icon: playerController.validate != false
                ? Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                    size: responsive.hp(5),
                  )
                : Icon(
                    Icons.pause,
                    color: const Color.fromARGB(255, 58, 204, 22),
                    size: responsive.hp(5),
                  )),
        IconButton(
            onPressed: () {
              playerController.next(
                  context, playerController.player!, playerController.song!);
            },
            icon: Icon(
              Icons.skip_next,
              color: theme.textColor,
              size: responsive.hp(5),
            )),
      ],
    );
  }
}
