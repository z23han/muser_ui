import 'dart:collection';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart';
import 'package:muser_ui/managers/music_managers.dart';
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
  HashMap<int, Music> musicMap;

  // singleton method 
  static final MusicService _singleton = MusicService._internal();

  factory MusicService () {
    return _singleton;
  }

  // only executed the first time when object is constructed
  MusicService._internal() {

    audioCache = new AudioCache(prefix: "music/");

    isInited = false;

    isPlaying = false;
  }

  initMusicService() async {

    if (this.isInited == false) {

      await init();

    } else {

      if (this.audioCache == null) {

        audioCache = new AudioCache();

        await reInitCache();

      } 
    }
  }

  loadCache() async {

    MusicManager musicManager = new MusicManager();

    this.musicMap = musicManager.musicMap;

    List<String> loadList = new List();

    this.musicMap.forEach((id, music) {
      loadList.add(music.url);
    });

    await audioCache.loadAll(loadList);

    print("loaded all the music into cache: $loadList");
  }

  reInitAudio() async {

    if (this.audioPlayer != null) {

      await this.audioPlayer.stop();

      await this.audioPlayer.dispose();
    }

    this.audioPlayer = null;

    this.music = null;

    print('musicService audioPlayer is re-inited');
  }

  reInitCache() async {

    if (this.audioCache != null) {

      this.audioCache.clearCache();
    }

    this.audioCache = new AudioCache(prefix: "music/");

    await loadCache();

    print('musicService audioCache is re-inited');
  }
  
  init() async {

    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
    }
    await loadCache();

    this.isInited = true;
  }

  play(int musicId) async {
    // assign music to the music_service
    this.music = this.musicMap[musicId];

    String musicUrl = this.music.url;

    this.audioPlayer = await audioCache.play(musicUrl);

    print("$musicUrl is playing");

    this.isPlaying = true;
  }

  pause() async {

    int result = await audioPlayer.pause();

    if (result == 1) {
      print("${this.music.name} is paused");
      this.isPlaying = false;
    }
  }

  resume() async {

    int result = await audioPlayer.resume();

    if (result == 1) {
      print("${this.music.name} is resumed");
      this.isPlaying = true;
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

}