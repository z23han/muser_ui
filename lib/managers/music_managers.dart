
import 'dart:collection';
import 'package:muser_ui/services/music.dart';

class MusicManager {

  static HashMap<int, List<Music>> _recommendationMusicMap = new HashMap();
  static HashMap<int, List<Music>> _allMusicMap = new HashMap();

  MusicManager() {
    _populateMusicMap();
  }

  void _populateMusicMap() {
    // TODO: get music list from DB. We hardcode for now 
    Music music_0 = new Music(musicId: 0, name: "music 0", writer: "July", tag: "Forrest Contemplation", categoryId: 0, image: 'assets/garfield11.jpg');
    Music music_1 = new Music(musicId: 1, name: "music 1", writer: "Mozart", tag: "Forrest Contemplation", categoryId: 1, image: 'assets/garfield12.jpg');
    Music music_2 = new Music(musicId: 2, name: "music 2", writer: "MayDay", tag: "Forrest Contemplation", categoryId: 2, image: 'assets/garfield13.jpg');
    Music music_3 = new Music(musicId: 3, name: "music 3", writer: "LiRongHao", tag: "Forrest Contemplation", categoryId: 3, image: 'assets/garfield14.jpg');
    Music music_4 = new Music(musicId: 4, name: "music 4", writer: "JayChou", tag: "Forrest Contemplation", categoryId: 3, image: 'assets/garfield15.jpg');
    Music music_5 = new Music(musicId: 5, name: "music 5", writer: "JJLin", tag: "Forrest Contemplation", categoryId: 3, image: 'assets/garfield16.jpg');

    List<Music> _musiclist_0 = new List();
    List<Music> _musiclist_1 = new List();
    List<Music> _musiclist_2 = new List();
    List<Music> _musiclist_3 = new List();
    _musiclist_0.add(music_0);
    _musiclist_0.add(music_1);
    _musiclist_0.add(music_3);
    _musiclist_1.add(music_1);
    _musiclist_1.add(music_2);
    _musiclist_1.add(music_3);
    _musiclist_2.add(music_2);
    _musiclist_2.add(music_3);
    _musiclist_2.add(music_4);
    _musiclist_3.add(music_3);
    _musiclist_3.add(music_4);
    _musiclist_3.add(music_5);
    _recommendationMusicMap.putIfAbsent(0, () => _musiclist_0);
    _recommendationMusicMap.putIfAbsent(1, () => _musiclist_1);
    _recommendationMusicMap.putIfAbsent(2, () => _musiclist_2);
    _recommendationMusicMap.putIfAbsent(3, () => _musiclist_3);
    
    _allMusicMap.putIfAbsent(0, () => _musiclist_0);
    _allMusicMap.putIfAbsent(1, () => _musiclist_1);
    _allMusicMap.putIfAbsent(2, () => _musiclist_2);
    _allMusicMap.putIfAbsent(3, () => _musiclist_3);
  }

  List<Music> getRecommendationMusic(int categoryId) {
    return _recommendationMusicMap[categoryId];
  }

  List<Music> getCategoryMusic(int categoryId) {
    return _allMusicMap[categoryId];
  }
}