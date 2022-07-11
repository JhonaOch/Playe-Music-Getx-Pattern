import 'package:app_music_flutter/app/utils/snackbart.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerControlller extends GetxController {
  SongModel? _song;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  AudioPlayer? _player;
  bool _validate = false;
  List<SongModel> listSongs = [];
  final OnAudioQuery audio = OnAudioQuery();
  int _i = 0;

  SongModel? get song => _song;
  AudioPlayer? get player => _player;
  Duration get duration => _duration;
  Duration get position => _position;
  bool get validate => _validate;
  int get i => _i;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    argumensData();
    getTracks();
  }

  argumensData() {
    final data = Get.arguments;
    _song = data["index"] as SongModel;
    _player = data["player"] as AudioPlayer;
    _i = data["i"];
    update();

    _player!.durationStream.listen((d) {
      _duration = d!;
      update();
    });

    _player!.positionStream.listen((p) {
      _position = p;
      update();
    });
  }

  void chagePositionSlider(int seconds, AudioPlayer data) async {
    Duration duration = Duration(seconds: seconds);
    await data.seek(duration);
    update();
  }

  void pause(AudioPlayer data) async {
    if (_validate == false) {
      _validate = true;
      await data.stop();
      update();
    }
  }

  void play(AudioPlayer data) async {
    if (_validate == true) {
      _validate = false;
      await data.play();
      update();
    }
  }

  Future<void> getTracks() async {
    listSongs = await audio.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );

    // print(songs);

    update();
  }

  void next(BuildContext context, AudioPlayer play, SongModel i) async {
    if (listSongs.length - 1 > _i) {
      for (var element in listSongs) {
        if (i.id == element.id) {
          try {
            var url = listSongs[_i + 1].uri.toString();
            _song = listSongs[_i + 1];
            _i = _i + 1;
            await setAudio(url, play);
            update();
          } catch (e) {
            mostrarAwesonSnackbar(
                context,
                "Error :O",
                "The format music is not support.\n Automatic play the next song",
                ContentType.warning);

            var url = listSongs[_i + 1].uri.toString();

            _song = listSongs[_i + 1];
            _i = _i + 1;
            await setAudio(url, play);
            update();
          }
        }
      }
    } else {
      print("Nivel de return");
    }
  }

  void previus(BuildContext context, AudioPlayer play, SongModel i) async {
    final number = _i - 1;
    if (number != -1) {
      print("ENTRO");
      for (var element in listSongs) {
        if (i.id == element.id) {
          try {
            var url = listSongs[_i - 1].uri.toString();
            _song = listSongs[_i - 1];
            _i = _i - 1;
            await setAudio(url, play);
            update();
          } catch (e) {
            mostrarAwesonSnackbar(
                context,
                "Error :O",
                "The format music is not support.\n Automatic play the next song",
                ContentType.warning);
            var url = listSongs[_i - 1].uri.toString();
            _song = listSongs[_i - 1];
            _i = _i - 1;
            await setAudio(url, play);
            update();
          }
        }
      }
    } else {
      print("Nivel de return");
    }
  }

  Future<void> setAudio(String url, AudioPlayer player) async {
    await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    await player.play();
    update();
  }
}
