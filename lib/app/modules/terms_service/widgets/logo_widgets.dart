import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Text(
      'Terms of Service ',
      style: GoogleFonts.acme(
        fontSize: responsive.dp(4),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: theme.textColor,
      ),
    );
  }
}
