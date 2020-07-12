import 'package:flutter/material.dart';

class GroupInstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * (135 / 360);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                      child: Text(
                        "活动音乐：",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/instruction/focusTraining');
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                              image: AssetImage('assets/tingge.png'),
                              width: buttonWidth)),
                      FlatButton(
                          onPressed: () {},
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
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/instruction/aboutMusic1');
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
                      Navigator.pushNamed(
                          context, '/instruction/focusTraining');
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
                    onTap: () {},
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
                ])));
  }
}