import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/responsive.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Container(
        height: responsive.hp(30),
        width: responsive.wp(90),
        decoration: BoxDecoration(
            color: theme.backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              overflow: TextOverflow.fade,
              'The app is governed by Star Music Terms Of service.\nBy continuing ro use this app you represent that you have read and accept the Terms of Service and Provacy Policy.',
              style: GoogleFonts.acme(
                  fontSize: responsive.dp(2), color: theme.textColor),
            ),
          )
        ]));
  }
}
