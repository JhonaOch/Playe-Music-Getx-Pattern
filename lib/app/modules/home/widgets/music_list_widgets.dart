import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/routes/app_routes.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:app_music_flutter/app/utils/snackbart.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicListWidgets extends StatelessWidget {
  final HomeController data;
  final ScrollController controller;

  const MusicListWidgets( {Key? key, required this.data, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemesUI theme = ThemesUI();
    return Scrollbar(
      // ignore: deprecated_member_use
      showTrackOnHover: true,
      controller: controller,
     
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: data.songs.length,
          itemBuilder: (context, index) {
            if (data.songs.isNotEmpty) {
              return ListTile(
                onTap: () async {
                  try {
                    await data.play(index);
                    await data.setAudio(data.songs[index].uri.toString());
                  } catch (e) {
                    print("Error loading audio source: $e");
    
                    mostrarAwesonSnackbar(
                        context,
                        "Error :O",
                        "The format music is not support.\n Automatic play the next song",
                        ContentType.warning);
                    Get.toNamed(AppRoute.PLAYER, arguments: data.songs[index + 1]);
                    await data.setAudio(data.songs[index + 1].uri.toString());
                  }
                },
                leading: CircleAvatar(
                  backgroundColor: theme.backgroundColor,
                  child: const Icon(
                    Icons.music_note_rounded,
                  ),
                ),
                title: Text(
                  "${index + 1}-${data.songs[index].title}",
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data.songs[index].artist.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                trailing: IconButton(
                    onPressed: () {
                      data.setAudio(data.songs[index].uri.toString());
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                    )),
              );
            } else {
              return Container(
                    padding:const EdgeInsets.all(8),
                    child: const Center(child: Text('Agrege canciones a su dispositivo.')),
                  );
            }
          }),
    );
  }
}
