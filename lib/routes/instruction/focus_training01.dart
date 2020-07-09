import 'package:flutter/material.dart';

class FocusTraining01 extends StatefulWidget {
  @override
  _FocusTraining01State createState() => _FocusTraining01State();
}

class _FocusTraining01State extends State<FocusTraining01> {
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
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Image(
                  image: AssetImage('assets/p1of3.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text('01. 课前准备',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Text('选择一首歌：',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 16)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: PageView()),
              Spacer(flex: 1),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/instruction/focus_training',
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
                        '/instruction/focus_training02',
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
          ),
          Column(
            children: <Widget>[
              SizedBox(height: size.height * (223 / 640)),
              PageView.builder(itemBuilder: null)
            ],
          )
        ]));
  }
}
