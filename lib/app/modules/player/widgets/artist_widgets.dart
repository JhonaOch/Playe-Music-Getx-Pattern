import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/modules/player/player_controller.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistWidgets extends StatelessWidget {
  final PlayerControlller playerController;
  const ArtistWidgets({Key? key, required this.playerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Center(
      child: Text(
        playerController.song!.artist.toString(),
        style: GoogleFonts.acme(
          fontSize: responsive.dp(3),
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.normal,
          color: theme.textColor,
        ),
      ),
    );
  }
}
