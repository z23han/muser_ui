import 'package:flutter/material.dart';
import 'package:muser_ui/routes/instruction/group/about_music2.dart';

class AboutMusic1 extends StatefulWidget {
  @override
  _AboutMusic1State createState() => _AboutMusic1State();
}

class _AboutMusic1State extends State<AboutMusic1> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double arrowSize = size.width * (34 / 360);
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/musicBase'));
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
          child: Column(                
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Image(
                image: AssetImage('assets/p1of2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
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
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/pyramid.png'),
              fit: BoxFit.fitWidth,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text('Pizzi的音乐治疗金字塔模型',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold))),
            Spacer(flex: 1),
            ButtonBar(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutMusic2()));
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
