import 'package:app_music_flutter/app/modules/home/home_controller.dart';
import 'package:app_music_flutter/app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Busqueda extends SearchDelegate {
  final List<SongModel> canciones;
  HomeController homeController;
  List<SongModel> filtro = [];
  final ThemesUI theme = ThemesUI();

  Busqueda({required this.canciones, required this.homeController});

  @override
  //Superior derecha limpieza de texto
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  //Superior izquierda limpieza de texto
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, 'result');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //Retorna la lista al presionar busqueda

    return Container(
      color: theme.backgroundColor,
      child: ListView.builder(
          itemCount: filtro.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              child: ListTile(
                title: Text(
                  filtro[i].title,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () async {
                close(context, 'result');
                FocusScope.of(context).unfocus();

                await homeController.setAudio(filtro[i].uri.toString());
              },
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Datos de segurencia
    filtro = canciones.where((canc) {
      return canc.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Container(
      color: theme.backgroundColor,
      child: ListView.builder(
          itemCount: filtro.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              child: ListTile(
                title: Text(
                  filtro[i].title,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () async {
                close(context, 'result');
                FocusScope.of(context).unfocus();

                await homeController.setAudio(filtro[i].uri.toString());
              },
            );
          }),
    );
  }
}
