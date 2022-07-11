import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidgets extends StatelessWidget {
  final PlayerControlller playerController;
  const SliderWidgets({Key? key, required this.playerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: responsive.wp(3), horizontal: responsive.wp(3)),
      child: Row(
        children: [
          Text(
            playerController.position.toString().split(".")[0],
            style: GoogleFonts.acme(
              fontSize: responsive.dp(2),
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.normal,
              color: theme.textColor,
            ),
          ),
          Expanded(
              child: Slider(
            value: playerController.position.inSeconds.toDouble(),
            min: const Duration(microseconds: 0).inSeconds.toDouble(),
            max: playerController.duration.inSeconds.toDouble() + 1,
            onChanged: (value) {
              final time = playerController.duration.inSeconds.toDouble() + 1;
              // print(value);
              // print(time);
              if (value == time) {
                playerController.next(
                    context, playerController.player!, playerController.song!);
              }
              playerController.chagePositionSlider(
                  value.toInt(), playerController.player!);
              value = value;
            },
          )),
          Text(
            playerController.duration.toString().split(".")[0],
            style: GoogleFonts.acme(
              fontSize: responsive.dp(2),
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.normal,
              color: theme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
