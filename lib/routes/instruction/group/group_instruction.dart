import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:muser_ui/routes/instruction/group/about_music1.dart';
import 'package:muser_ui/routes/instruction/group/focus_training.dart';
import 'package:muser_ui/routes/instruction/group/auditory_perception.dart';
import 'package:muser_ui/services/music_service.dart';

class GroupInstruction extends StatelessWidget {
  final MusicService musicService = new MusicService();

  final GetIt getIt = GetIt.instance;

  _turnOffMusic() async {
    if (this.musicService.music != null) {
      this.musicService.reInitAudio();
    }
  }

  _initSelectedMusic() async {
    print('initialize selected music');

    String musicId = await getIt<FlutterSecureStorage>().read(key: 'selected_music_id');

    if (musicId != null) {

      print('deleting old selected_music_id $musicId');

      await getIt<FlutterSecureStorage>().delete(key: 'selected_music_id');

      print('old selected_music_id $musicId is deleted');
    }
  }

  @override
  Widget build(BuildContext context) {

    _turnOffMusic();

    _initSelectedMusic();

    final Size size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * (135 / 360);
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                    child: Text(
                      "活动音乐：",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FocusTraining()));
                        },
                        padding: EdgeInsets.all(0.0),
                        child: Image(
                            image: AssetImage('assets/tingge.png'),
                            width: buttonWidth)),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuditoryPerception()));
                        },
                        padding: EdgeInsets.all(0.0),
                        child: Image(
                            image: AssetImage('assets/shiqu.png'),
                            width: buttonWidth)),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                    child: Text(
                      "课程：",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutMusic1()));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/book.png'),
                          width: 32,
                          height: 32,
                        ),
                      ),
                      Text('音乐治疗金字塔',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16))
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xfff5f5f5),
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FocusTraining()));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/heartbeat.png'),
                          width: 32,
                          height: 32,
                        ),
                      ),
                      Text('注意力训练：听歌寻字',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16))
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xfff5f5f5),
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuditoryPerception()));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/heartbeat.png'),
                          width: 32,
                          height: 32,
                        ),
                      ),
                      Text('听觉感知训练：识曲拍手',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 16))
                    ],
                  ),
                ),
                SizedBox(height: 30)
              ])),
    ));
  }
}
