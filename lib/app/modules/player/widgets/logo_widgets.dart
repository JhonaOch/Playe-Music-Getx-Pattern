import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';

class LogoWidgets extends StatelessWidget {
  const LogoWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final ThemesUI theme = ThemesUI();
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: responsive.hp(3),
          ),
          CircleAvatar(
            backgroundColor: theme.backgroundColor,
            radius: responsive.dp(13),
            child: Icon(
              Icons.music_note,
              size: responsive.dp(10),
            ),
          ),
        ],
      ),
    );
  }
}
