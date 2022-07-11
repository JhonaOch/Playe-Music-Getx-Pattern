import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidgets extends StatelessWidget {
  final PlayerControlller playerController;
  const TitleWidgets({Key? key, required this.playerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.dp(2)),
      child: Center(
        child: Text(
          playerController.song!.title.toString(),
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: GoogleFonts.acme(
            fontSize: responsive.dp(3),
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
