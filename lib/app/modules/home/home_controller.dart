

import 'package:app_music_flutter/app/data/repositories/local/storage_repository.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  var status = Permission.storage;
  final StorageRepository repository = StorageRepository();
  String _validator = '';
  final OnAudioQuery audio = OnAudioQuery();
  final AudioPlayer player = AudioPlayer();

  List<SongModel> songs = [];

  get validator => _validator;

  @override
  void onReady() async{
    super.onReady();
    await checkPermissions();
  }

    //Permision the storage app 
  Future<void> checkPermissions() async {
    if (await status.request().isDenied) {
      _validator = false.toString();
      update();
    } else if (await status.request().isGranted) {
      _validator = true.toString();
      await repository.setSession(validator);
      await getTracks();
      update();
    }
  }

//Get songs the device in external type
  Future<void> getTracks() async {
    songs = await audio.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    update();
  }

  //Uri the song and play the song
  Future<void> setAudio(String url) async {
      await player.setAudioSource(
        AudioSource.uri(Uri.parse(
          url)));
      await player.play();
      update();
  }

//Send arguments to Page Player
  Future<void> play(index) async {
       Get.toNamed(AppRoute.PLAYER,arguments:{
        "index":songs[index],
        "player":player,
        "i":index
       });
       update();
  }
}
