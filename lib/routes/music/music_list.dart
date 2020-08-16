import 'package:flutter/material.dart';
import 'package:muser_ui/managers/music_managers.dart';
import 'package:muser_ui/routes/music/music_player.dart';
import 'package:muser_ui/models/music_object.dart';

class MusicListScreen extends StatefulWidget {
  final int categoryId;

  const MusicListScreen({this.categoryId});

  @override
  _MusicListScreenState createState() {
    return _MusicListScreenState();
  }
}

class _MusicListScreenState extends State<MusicListScreen> {
  List<Music> _musicList;
  List<Music> _recommendationMusicList;
  final MusicManager _musicManager = new MusicManager();

  void _populateMusicMap() {
    _musicList = this._musicManager.getCategoryMusic(widget.categoryId);
    _recommendationMusicList =
        this._musicManager.getRecommendationMusic(widget.categoryId);
  }

  List<Widget> _getRecommendationMusicList() {
    final Size size = MediaQuery.of(context).size;
    final blockHeight = size.width * (140 / 360);
    final blockWidth = size.width * (105 / 360);
    final imageHeight = size.width * (105 / 360);
    final imageWidth = imageHeight;

    List<InkWell> musicBlocks = new List();
    for (Music music in this._recommendationMusicList) {
      InkWell block = new InkWell(
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Container(
            width: blockWidth,
            height: blockHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: imageHeight,
                  width: imageWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(music.image), fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          music.name.length >= 10
                              ? music.name.substring(0, 10) + ".."
                              : music.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16)),
                      Text(
                        music.writer.length >= 14
                            ? music.writer.substring(0, 14) + ".."
                            : music.writer,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          print("${music.name} is tapped");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MusicPlayerScreen(music: music)));
        },
      );
      musicBlocks.add(block);
    }
    return musicBlocks;
  }

  List<Widget> _getAllMusicList(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width * (42 / 360);
    final double height = width;
    final double playIconWidth = size.width * (26 / 360);

    List<InkWell> musicBlocks = new List();
    for (Music music in this._musicList) {
      InkWell block = new InkWell(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              //                   <--- left side
              color: Color(0xffe8e8e8),
              width: 0.5,
            ),
          )),
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
                      image: DecorationImage(
                          image: AssetImage(music.image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Wrap(direction: Axis.vertical, children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: music.name.length >= 9
                                ? music.name.substring(0, 9) + ".."
                                : music.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: music.writer.length >= 10
                                  ? '   ${music.writer.substring(0, 10)}' + ".."
                                  : '   ${music.writer}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal))
                        ])),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        '#' +
                            (music.tag.length >= 20
                                ? music.tag.substring(0, 20) + '..'
                                : music.tag),
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ]),
                ),
                Image(
                  image: AssetImage('assets/play.png'),
                  width: playIconWidth,
                  height: playIconWidth,
                )
              ],
            ),
          ),
        ),
        onTap: () {
          print("${music.name} is tapped");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MusicPlayerScreen(music: music)));
        },
      );
      musicBlocks.add(block);
    }
    return musicBlocks;
  }

  @override
  Widget build(BuildContext context) {
    _populateMusicMap();

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
            child: Text(
              '推荐歌单',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                  left: 28.0, right: 0.0, top: 15.0, bottom: 15.0),
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
    );
  }
}
