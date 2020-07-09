import 'package:flutter/material.dart';

class FocusTraining02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double arrowSize = size.width * (34 / 360);
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(
                  image: AssetImage('assets/cross.png'),
                  width: 24,
                  height: 24,
                ),
              ),
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Image(
                image: AssetImage('assets/p2of3.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('02. 游戏规则',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image(
                image: AssetImage('assets/focus_training_game_rules.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: RichText(
                text: TextSpan(
                    text: '参与者围成一圈1-3报数，不同数字对应不同听到音乐后的动作。当听到歌词中有',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                          text: '   "x"   ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '(例如：'),
                      TextSpan(
                          text: '   "爱"   ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ')的时候，参与者同时拍手/跺脚/跳跃。'),
                    ]),
              ),
            ),
            Spacer(flex: 1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/instruction/focus_training01',
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/backward.png'),
                    width: arrowSize,
                    height: arrowSize,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/instruction/focus_training03',
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/forward.png'),
                    width: arrowSize,
                    height: arrowSize,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * (55 / 640))
          ]),
        ));
  }
}
