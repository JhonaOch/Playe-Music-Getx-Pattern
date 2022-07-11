import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/modules/home/widgets/appbar_widgets.dart';
import 'package:app_music_flutter/app/modules/home/widgets/music_list_widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) => Scaffold(
            appBar: appBar(context, homeController.songs, homeController),
            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/imgs/fondo4.jpg'),
                  fit: BoxFit.cover,
                )),
                child: homeController.validator == 'false'
                    ? Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              await homeController.checkPermissions();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 16, 25, 43)),
                            child: const Text('Permisos')),
                      )
                    : homeController.songs.isNotEmpty
                        ? MusicListWidgets(
                            data: homeController,
                            controller: controller,
                          )
                        : Container(
                            padding: const EdgeInsets.all(8),
                            child: const Center(
                                child: Text(
                                    'Agrege canciones a su dispositivo o habilite\n\n los permisos de archivo y multimedia.',
                                    style: TextStyle(color: Colors.white))),
                          ))));
  }
}
