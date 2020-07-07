import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muser_ui/managers/music_managers.dart';
import 'package:muser_ui/services/music.dart';

class MusicListScreen extends StatefulWidget {
  int _categoryId;

  MusicListScreen(int categoryId) {
    this._categoryId = categoryId;
  }

  @override
  _MusicListScreenState createState() {
    return _MusicListScreenState(this._categoryId);
  }
}

class _MusicListScreenState extends State<MusicListScreen> {
  int _categoryId;
  List<Music> _musicList;
  List<Music> _recommendationMusicList;
  final MusicManager _musicManager = new MusicManager();

  _MusicListScreenState(int categoryId) {
    this._categoryId = categoryId;

    _populateMusicMap();
  }

  void _populateMusicMap() {
    _musicList = this._musicManager.getCategoryMusic(this._categoryId);
    _recommendationMusicList =
        this._musicManager.getRecommendationMusic(this._categoryId);
  }

  List<Widget> _getRecommendationMusicList() {
    List<Container> musicBlocks = new List();
    for (Music music in this._recommendationMusicList) {
      Container block = Container(
        width: 160,
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Wrap(
            children: <Widget>[
              Image.asset(music.image),
              ListTile(
                title: Text(music.name),
                subtitle: Text(music.writer),
              )
            ],
          ),
        ),
      );
      musicBlocks.add(block);
    }
    return musicBlocks;
  }

  List<Widget> _getAllMusicList(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    final double width = size.width * (50 / 360);
    final double height = width;
    return this._musicList.map((i) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
                color: Colors.grey[300],
                child: Row(
                  children: <Widget>[
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          image: DecorationImage(image: AssetImage(i.image))),
                    ),
                    Expanded(
                      child: Wrap(direction: Axis.vertical, children: <Widget>[
                        RichText(
                            text: TextSpan(
                                text: i.name,
                                children: [TextSpan(text: '  ${i.writer}')])),
                        Text('#' + i.tag),
                      ]),
                    ),
                    Icon(FontAwesomeIcons.play)
                  ],
                ),
              ),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
              child: Text(
                'Recommanded Songs',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getRecommendationMusicList(),
                  ),
                )),
            Container(
                padding: EdgeInsets.only(
                    left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
                child: Column(
                  children: _getAllMusicList(context),
                )),
          ],
        ),
      ),
    );
  }
}
