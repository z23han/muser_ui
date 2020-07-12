import 'package:flutter/material.dart';
import 'package:muser_ui/managers/music_managers.dart';
import 'package:muser_ui/models/music_object.dart';

class MusicSelection extends StatefulWidget {
  final int musiclistCategoryId;
  const MusicSelection({this.musiclistCategoryId});
  @override
  _MusicSelectionState createState() => _MusicSelectionState();
}

class _MusicSelectionState extends State<MusicSelection> {
  final MusicManager _musicManager = MusicManager();
  List<Music> _recommendationMusicList;
  Set<Music> selectedMusic = {};
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);
  bool isPlaying = false;

  void _populateMusicMap() {
    _recommendationMusicList =
        this._musicManager.getRecommendationMusic(widget.musiclistCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildMusicSelection());
  }

  Stack _buildMusicSelection() {
    _populateMusicMap();
    return Stack(
      children: <Widget>[
        _buildMusicSelectionPageView(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildBoxShadow('left'),
              _buildBoxShadow('right')
            ])
      ],
    );
  }

  Container _buildBoxShadow(String direction) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: size.width * 0.8,
        width: 30,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: direction == 'left'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                end: direction == 'left'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                colors: [Colors.white, Colors.white.withOpacity(0)])));
  }

  Container _buildMusicSelectionPageView() {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: size.width * 0.8,
        child: PageView.builder(
            itemCount: _recommendationMusicList.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    _buildPageViewItem(_recommendationMusicList[index], index),
              ));
            },
            controller: pageController));
  }

  GestureDetector _buildPageViewItem(Music music, int index) {
    final Size size = MediaQuery.of(context).size;
    final double coverSize = size.width * 0.5 - 20 * 2 - 15 * 2;
    bool active = selectedMusic.contains(music);
    return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedMusic.contains(music)) {
              selectedMusic.remove(music);
            } else {
              if (selectedMusic.isNotEmpty) {
                selectedMusic.clear();
              }
              selectedMusic.add(music);
            }
          });
        },
        child: Opacity(
          opacity: active ? 0.6 : 1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Color(0xff343434)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff343434).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(5, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: coverSize,
                    height: coverSize,
                    child: Stack(children: [
                      Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage(music.image), fit: BoxFit.cover),
                      )),
                      Center(
                          child: IconButton(
                        icon: Icon(
                            !isPlaying
                                ? Icons.play_circle_outline
                                : Icons.pause_circle_outline,
                            size: 34,
                            color: Colors.white.withOpacity(0.6)),
                        onPressed: () {},
                      ))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(music.name,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Text(music.writer,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('#' + music.tag,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(fontSize: 14)),
                  ),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('选择这首歌',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 12)),
                      SizedBox(width: 5),
                      Icon(
                          active
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          color: Theme.of(context).accentColor,
                          size: 20),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}