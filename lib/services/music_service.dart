import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart';
import 'package:muser_ui/models/music_object.dart';
import 'package:path_provider/path_provider.dart';

class MusicService {

  Music music;
  AudioCache audioCache;
  AudioPlayer audioPlayer;
  String filePath;
  int duration;
  bool isInited;
  int currDuration = 0;
  bool isPlaying;

  // singleton method 
  static final MusicService _singleton = MusicService._internal();

  factory MusicService () {
    return _singleton;
  }

  // only executed the first time when object is constructed
  MusicService._internal() {
    audioCache = new AudioCache();
    audioPlayer = new AudioPlayer();
    isInited = false;
    isPlaying = false;
  }

  void setMusic(Music music) {
    this.music = music;
  }

  initMusicService() async {
    if (this.isInited == false) {
      await init();
    } else {
      await dispose();
      reInitAudio();
    }
  }
  
  init() async {
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      audioPlayer.startHeadlessService();
    }
    this.isInited = true;
  }

  play() async {
    int result = await audioPlayer.play(this.filePath, isLocal: true);
    if (result == 1) {
      print("${this.music.name} is playing");
      this.isPlaying = true;
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("${this.music.name} is paused");
      this.isPlaying = false;
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print("${this.music.name} is stopped");
      this.isPlaying = false;
    }
  }

  seek(double newValue) async {
    int result = await audioPlayer.seek(Duration(milliseconds: newValue.toInt()));
    if (result == 1) {
      print('${this.music.name} is set to $newValue in milliseconds');
    }
  }

  Future downloadFile() async {
    final bytes = await readBytes(music.url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/music.mp3');
    try {
      await file.delete();
      print('deleted existing file ${file.path}');
    } catch (e) { }

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      this.filePath = file.path;
      print('Downloaded music ${music.name} to ${this.filePath}');

      await audioPlayer.setUrl(this.filePath);
      this.duration = await Future.delayed(
        Duration(seconds: 1), () => audioPlayer.getDuration()
      );
      print('music duration ${this.duration}');
    }
  }

  dispose() async {
    audioCache.clearCache();
    await audioPlayer.stop();
    await audioPlayer.dispose();
  }

  reInitAudio() {
    this.audioPlayer = new AudioPlayer();
    this.audioCache = new AudioCache();
  }

}