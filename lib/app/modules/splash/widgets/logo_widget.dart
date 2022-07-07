import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final ThemesUI theme = ThemesUI();
    return Column(
      children: [
        SizedBox(
          height: responsive.hp(10),
        ),
        Text(
          'Star Music',
          style: GoogleFonts.acme(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontSize: responsive.dp(8),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: theme.textColor),
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        Image.asset('assets/gifs/loading.gif'),
        SizedBox(
          height: responsive.hp(12),
        ),
      ],
    );
  }
}
