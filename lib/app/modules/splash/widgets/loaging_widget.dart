import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoagingPage extends StatelessWidget {
  const LoagingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final ThemesUI theme = ThemesUI();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            minHeight: 20,
            backgroundColor: theme.fontColorLight,
            color: theme.textColor,
          ),
          Text(
            'Cargando...',
            style: GoogleFonts.acme(
                fontSize: responsive.dp(4),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: theme.textColor),
          )
        ],
      ),
    );
  }
}
