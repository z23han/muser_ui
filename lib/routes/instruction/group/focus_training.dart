import 'package:flutter/material.dart';
import 'package:muser_ui/routes/instruction/group/focus_training01.dart';
import 'package:muser_ui/services/music_service.dart';

class FocusTraining extends StatelessWidget {
  final MusicService musicService = new MusicService();

  turnOffMusic() async {
    if (this.musicService.music != null) {
      await this.musicService.reInitAudio();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double imageWidth = size.width * (213 / 360);
    final double quotePositioner = size.height * (212 / 640);
    final double quoteDecorWidth = size.width * (253 / 360);
    final double buttonWidth = size.width * (190 / 360);
    final double buttonHeight = buttonWidth * (34 / 190);

    turnOffMusic();

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0,
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: <Widget>[
                //go back button
                IconButton(
                    icon: Icon(Icons.arrow_back,
                        size: 24, color: Theme.of(context).buttonColor),
                    onPressed: () => Navigator.of(context).pop()),
              ]))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Image(
                image: AssetImage('assets/p0of3.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image(
                        image: AssetImage('assets/heartbeat.png'),
                        width: 32,
                        height: 32),
                  ),
                  Text('注意力训练：听歌寻字',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: quotePositioner),
                      Image(
                        image:
                            AssetImage('assets/focus_training_quoteDecor.png'),
                        width: quoteDecorWidth,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Image(
                          image: AssetImage('assets/focus_training.png'),
                          width: imageWidth,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RichText(
                          text: TextSpan(
                              text: '当听到歌词中有',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: '   "x"   ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                                TextSpan(text: '的时候，\n拍手/跺脚/发声。')
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(flex: 1),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              child: Container(
                width: buttonWidth,
                height: buttonHeight,
                child: FlatButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FocusTraining01()));
                    },
                    child: Center(
                        child: Text('开始学习',
                            style: Theme.of(context).textTheme.button))),
              ),
            ),
            SizedBox(height: size.height * (55 / 640))
          ],
        ),
      ),
    );
  }
}
