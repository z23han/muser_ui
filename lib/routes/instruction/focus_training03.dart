import 'package:flutter/material.dart';

class FocusTraining03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * (88 / 360);
    final double buttonHeight = buttonWidth * (36 / 88);
    final double arrowSize = size.width * (34 / 360);
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                image: AssetImage('assets/p3of3.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('03. 游戏变化',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "除了听歌词中特定的字，也可以：\n（1）听歌曲中出现的指定伴奏乐器\n（2）听歌曲中出现的指定旋律\n（3）听歌曲中出现的指定音调",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Spacer(flex: 1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/instruction/focusTraining02',
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/backward.png'),
                    width: arrowSize,
                    height: arrowSize,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: FlatButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('完成',
                            style: Theme.of(context).textTheme.button)),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * (55 / 640))
          ]),
        ));
  }
}
