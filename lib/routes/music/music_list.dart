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
    final Size size = MediaQuery.of(context).size;
    final blockHeight = size.width * (154 / 360);
    final blockWidth = size.width * (105 / 360);
    final imageHeight = size.width * (105 / 360);
    final imageWidth = imageHeight;

    List<Container> musicBlocks = new List();
    for (Music music in this._recommendationMusicList) {
      Container block = Container(
        width: blockWidth,
        height: blockHeight,
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Container(
                height: imageHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(music.image))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(music.name), Text(music.writer)],
                ),
              ),
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
    final double width = size.width * (42 / 360);
    final double height = width;

    List<Container> musicBlocks = new List();
    for (Music music in this._musicList) {
      Container musicBlock = new Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    image: DecorationImage(image: AssetImage(music.image))),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Wrap(direction: Axis.vertical, children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: music.name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: '  ${music.writer}',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                      ])),
                  Text('#' + music.tag),
                ]),
              ),
              Icon(FontAwesomeIcons.play)
            ],
          ),
        ),
      );
      musicBlocks.add(musicBlock);
    }
    return musicBlocks;
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
                  physics: BouncingScrollPhysics(),
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
