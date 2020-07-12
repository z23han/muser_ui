import 'package:muser_ui/models/music_object.dart';
import 'package:muser_ui/services/music_service.dart';

class MusicInstance {

  MusicService musicService;
  Music music;

  static final MusicInstance _singleton = MusicInstance._internal();

  factory MusicInstance() {
    return _singleton;
  }

  MusicInstance._internal() {
    musicService = new MusicService();
  }


  void setMusic(Music music) {
    this.music = music;
  }


  init(Music music) async {

    setMusic(music);

    if (this.musicService.music == null) {

      await this.musicService.initMusicService();

    } else {

      await this.musicService.reInitAudio();

    }
  }
  

  play() async {
    await this.musicService.play(this.music.musicId);
  }


  pause() async {
    await this.musicService.pause();
  }


  resume() async {
    await this.musicService.resume();
  }
}