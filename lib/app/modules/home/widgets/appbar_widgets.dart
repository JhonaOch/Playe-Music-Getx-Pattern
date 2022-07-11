import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/modules/home/home_page.dart';
import 'package:app_music_flutter/app/modules/home/widgets/search_widgets.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

PreferredSizeWidget appBar(BuildContext context, List<SongModel> songs,
    HomeController homeController) {
  final Responsive responsive = Responsive(context);
  final ThemesUI theme = ThemesUI();
  return AppBar(
    backgroundColor: theme.backgroundColor,
    title: Text(
      'Star Music',
      style: GoogleFonts.acme(
        fontSize: responsive.dp(3),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Get.off(() => const HomePage(),
                transition: Transition.zoom,
                duration: const Duration(seconds: 4));
          },
          icon: const Icon(Icons.home)),
      IconButton(
          onPressed: () {
            showSearch(
                context: context,
                delegate:
                    Busqueda(canciones: songs, homeController: homeController));
          },
          icon: const Icon(Icons.search))
    ],
  );
}
