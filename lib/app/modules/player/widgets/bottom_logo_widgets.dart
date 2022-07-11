import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:flutter/material.dart';

class BottomLogoWidgets extends StatelessWidget {
  const BottomLogoWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemesUI theme = ThemesUI();
    return Expanded(
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: theme.backgroundColor,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/gifs/portada.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
