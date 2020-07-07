import 'package:flutter/material.dart';

class FocusTraining extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double imageWidth = size.width * (177 / 360);
    final double imageHeight = imageWidth * (137 / 177);
    final double contentPaddingLeft = size.width * (32 / 360) - 30;
    final double quotePositioner = imageHeight + size.height * (30 / 640);
    final double quoteDecorWidth = size.width * (292 / 360);
    final double quoteDecorHeight = quoteDecorWidth * (91 / 292);
    final double buttonWidth = size.width * (190 / 360);
    final double buttonHeight = buttonWidth * (34 / 190);
    final double contentWrapWidth = quoteDecorWidth;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * (56 / 640)),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image(
                      image: AssetImage('assets/heartbeat.png'),
                      width: 32,
                      height: 32),
                ),
                Text('注意力训练：听歌寻字',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 16))
              ],
            ),
            SizedBox(height: size.height * (44 / 640)),
            Row(
              children: <Widget>[
                SizedBox(width: contentPaddingLeft),
                Container(
                  alignment: Alignment.topCenter,
                  width: contentWrapWidth,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: quotePositioner),
                          Image(
                              image: AssetImage(
                                  'assets/focus_training_quoteDecor.png'),
                              width: quoteDecorWidth,
                              height: quoteDecorHeight)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                              image: AssetImage('assets/focus_training.png'),
                              width: imageWidth,
                              height: imageHeight),
                          SizedBox(height: size.height * (57 / 640)),
                          RichText(
                            text: TextSpan(
                                text: '当听到歌词中有',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: '   "x"   ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '的时候，\n拍手/跺脚/发声。')
                                ]),
                          ),
                          SizedBox(height: size.height * (35 / 640)),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            child: Container(
                              width: buttonWidth,
                              height: buttonHeight,
                              child: FlatButton(
                                  color: Theme.of(context).accentColor,
                                  onPressed: () {},
                                  child: Center(
                                      child: Text('开始学习',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button))),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
