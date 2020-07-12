import 'dart:collection';
import 'package:muser_ui/models/music_object.dart';

class MusicManager {
  HashMap<int, List<Music>> recommendationMusicMap = new HashMap();
  HashMap<int, List<Music>> categoryMusicMap = new HashMap();
  HashMap<int, Music> musicMap = new HashMap();
  HashMap<String, int> nameToId = new HashMap();

  static final MusicManager _singleton = MusicManager._internal();

  MusicManager._internal() {
    _populateMusicMap();
  }

  factory MusicManager() {
    return _singleton;
  }

  void _populateMusicMap() {
    Music music_0 = new Music(
        musicId: 0,
        name: "BBQ song",
        writer: "Anonymous",
        tag: "Quiet",
        categoryId: 0,
        image: 'assets/music_cover/music_cover00.png',
        url: "BBQ_song.mp3");
    Music music_1 = new Music(
        musicId: 1,
        name: "Bells and Drum",
        writer: "Anonymous",
        tag: "Quiet",
        categoryId: 0,
        image: 'assets/music_cover/music_cover01.png',
        url: "Bells_and_Drum.mp3");
    Music music_2 = new Music(
        musicId: 2,
        name: "Boomwhacker Chant",
        writer: "Anonymous",
        tag: "Quiet",
        categoryId: 0,
        image: 'assets/music_cover/music_cover02.png',
        url: "Boomwhacker_Chant.mp3");
    Music music_3 = new Music(
        musicId: 3,
        name: "Bubbles in the Air",
        writer: "Anonymous",
        tag: "Quiet",
        categoryId: 0,
        image: 'assets/music_cover/music_cover03.png',
        url: "Bubbles_in_the_Air.mp3");
    Music music_4 = new Music(
        musicId: 4,
        name: "Bubble Song",
        writer: "Anonymous",
        tag: "Quiet",
        categoryId: 0,
        image: 'assets/music_cover/music_cover04.png',
        url: "Bubble_Song.mp3");

    Music music_5 = new Music(
        musicId: 5,
        name: "Can you move like this",
        writer: "Anonymous",
        tag: "Focus",
        categoryId: 1,
        image: 'assets/music_cover/music_cover10.png',
        url: "Can_you_move_like_this.mp3");
    Music music_6 = new Music(
        musicId: 6,
        name: "Come and play",
        writer: "Anonymous",
        tag: "Focus",
        categoryId: 1,
        image: 'assets/music_cover/music_cover11.png',
        url: "Come_and_play.mp3");
    Music music_7 = new Music(
        musicId: 7,
        name: "Copy Cat",
        writer: "Anonymous",
        tag: "Focus",
        categoryId: 1,
        image: 'assets/music_cover/music_cover12.png',
        url: "Copy_Cat.mp3");
    Music music_8 = new Music(
        musicId: 8,
        name: "Do This",
        writer: "Anonymous",
        tag: "Focus",
        categoryId: 1,
        image: 'assets/music_cover/music_cover13.png',
        url: "Do_This.mp3");
    Music music_9 = new Music(
        musicId: 9,
        name: "Drum in the Middle of the room",
        writer: "Anonymous",
        tag: "Focus",
        categoryId: 1,
        image: 'assets/music_cover/music_cover14.png',
        url: "Drum_in_the_Middle_of_the_room.mp3");

    Music music_10 = new Music(
        musicId: 10,
        name: "Everybody has a Name",
        writer: "Anonymous",
        tag: "Sleep",
        categoryId: 2,
        image: 'assets/music_cover/music_cover20.png',
        url: "Everybody_has_a_Name.mp3");
    Music music_11 = new Music(
        musicId: 11,
        name: "Feelings",
        writer: "Anonymous",
        tag: "Sleep",
        categoryId: 2,
        image: 'assets/music_cover/music_cover21.png',
        url: "Feelings.mp3");
    Music music_12 = new Music(
        musicId: 12,
        name: "Feel it",
        writer: "Anonymous",
        tag: "Sleep",
        categoryId: 2,
        image: 'assets/music_cover/music_cover22.png',
        url: "Feel_it.mp3");
    Music music_13 = new Music(
        musicId: 13,
        name: "Gathering Drum",
        writer: "Anonymous",
        tag: "Sleep",
        categoryId: 2,
        image: 'assets/music_cover/music_cover23.png',
        url: "Gathering_Drum.mp3");
    Music music_14 = new Music(
        musicId: 14,
        name: "Get up, March out",
        writer: "Anonymous",
        tag: "Sleep",
        categoryId: 2,
        image: 'assets/music_cover/music_cover24.png',
        url: "Get_up_March_out.mp3");

    Music music_15 = new Music(
        musicId: 15,
        name: "Goodbye My Friend",
        writer: "Anonymous",
        tag: "Activate",
        categoryId: 3,
        image: 'assets/music_cover/music_cover30.png',
        url: "Goodbye_My_Friend.mp3");
    Music music_16 = new Music(
        musicId: 16,
        name: "Hello",
        writer: "Anonymous",
        tag: "Activate",
        categoryId: 3,
        image: 'assets/music_cover/music_cover31.png',
        url: "Hello.mp3");
    Music music_17 = new Music(
        musicId: 17,
        name: "Hello And Welcome",
        writer: "Anonymous",
        tag: "Activate",
        categoryId: 3,
        image: 'assets/music_cover/music_cover32.png',
        url: "Hello_And_Welcome.mp3");
    Music music_18 = new Music(
        musicId: 18,
        name: "Hello to You",
        writer: "Anonymous",
        tag: "Activate",
        categoryId: 3,
        image: 'assets/music_cover/music_cover33.png',
        url: "Hello_to_You.mp3");
    Music music_19 = new Music(
        musicId: 19,
        name: "Hey Ho It's Time to Go",
        writer: "Anonymous",
        tag: "Activate",
        categoryId: 3,
        image: 'assets/music_cover/music_cover34.png',
        url: "Hey_Ho_It_s_Time_to_Go.mp3");

    musicMap.putIfAbsent(0, () => music_0);
    musicMap.putIfAbsent(1, () => music_1);
    musicMap.putIfAbsent(2, () => music_2);
    musicMap.putIfAbsent(3, () => music_3);
    musicMap.putIfAbsent(4, () => music_4);
    musicMap.putIfAbsent(5, () => music_5);
    musicMap.putIfAbsent(6, () => music_6);
    musicMap.putIfAbsent(7, () => music_7);
    musicMap.putIfAbsent(8, () => music_8);
    musicMap.putIfAbsent(9, () => music_9);
    musicMap.putIfAbsent(10, () => music_10);
    musicMap.putIfAbsent(11, () => music_11);
    musicMap.putIfAbsent(12, () => music_12);
    musicMap.putIfAbsent(13, () => music_13);
    musicMap.putIfAbsent(14, () => music_14);
    musicMap.putIfAbsent(15, () => music_15);
    musicMap.putIfAbsent(16, () => music_16);
    musicMap.putIfAbsent(17, () => music_17);
    musicMap.putIfAbsent(18, () => music_18);
    musicMap.putIfAbsent(19, () => music_19);

    nameToId.putIfAbsent(music_0.name, () => 0);
    nameToId.putIfAbsent(music_1.name, () => 1);
    nameToId.putIfAbsent(music_2.name, () => 2);
    nameToId.putIfAbsent(music_3.name, () => 3);
    nameToId.putIfAbsent(music_4.name, () => 4);
    nameToId.putIfAbsent(music_5.name, () => 5);
    nameToId.putIfAbsent(music_6.name, () => 6);
    nameToId.putIfAbsent(music_7.name, () => 7);
    nameToId.putIfAbsent(music_8.name, () => 8);
    nameToId.putIfAbsent(music_9.name, () => 9);
    nameToId.putIfAbsent(music_10.name, () => 10);
    nameToId.putIfAbsent(music_11.name, () => 11);
    nameToId.putIfAbsent(music_12.name, () => 12);
    nameToId.putIfAbsent(music_13.name, () => 13);
    nameToId.putIfAbsent(music_14.name, () => 14);
    nameToId.putIfAbsent(music_15.name, () => 15);
    nameToId.putIfAbsent(music_16.name, () => 16);
    nameToId.putIfAbsent(music_17.name, () => 17);
    nameToId.putIfAbsent(music_18.name, () => 18);
    nameToId.putIfAbsent(music_19.name, () => 19);

    List<Music> _musiclist_0 = new List();
    List<Music> _musiclist_1 = new List();
    List<Music> _musiclist_2 = new List();
    List<Music> _musiclist_3 = new List();

    _musiclist_0.add(music_0);
    _musiclist_0.add(music_1);
    _musiclist_0.add(music_2);
    _musiclist_0.add(music_3);
    _musiclist_0.add(music_4);

    _musiclist_1.add(music_5);
    _musiclist_1.add(music_6);
    _musiclist_1.add(music_7);
    _musiclist_1.add(music_8);
    _musiclist_1.add(music_9);

    _musiclist_2.add(music_10);
    _musiclist_2.add(music_11);
    _musiclist_2.add(music_12);
    _musiclist_2.add(music_13);
    _musiclist_2.add(music_14);

    _musiclist_3.add(music_15);
    _musiclist_3.add(music_16);
    _musiclist_3.add(music_17);
    _musiclist_3.add(music_18);
    _musiclist_3.add(music_19);

    recommendationMusicMap.putIfAbsent(0, () => _musiclist_0);
    recommendationMusicMap.putIfAbsent(1, () => _musiclist_1);
    recommendationMusicMap.putIfAbsent(2, () => _musiclist_2);
    recommendationMusicMap.putIfAbsent(3, () => _musiclist_3);

    categoryMusicMap.putIfAbsent(0, () => _musiclist_0);
    categoryMusicMap.putIfAbsent(1, () => _musiclist_1);
    categoryMusicMap.putIfAbsent(2, () => _musiclist_2);
    categoryMusicMap.putIfAbsent(3, () => _musiclist_3);
  }

  List<Music> getRecommendationMusic(int categoryId) {
    return recommendationMusicMap[categoryId];
  }

  List<Music> getCategoryMusic(int categoryId) {
    return categoryMusicMap[categoryId];
  }
}
