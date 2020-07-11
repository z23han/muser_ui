import 'package:flutter/material.dart';

class InstructionScreen extends StatefulWidget {
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      bottom: 15.0, top: 30.0, left: 30.0, right: 30.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "活动音乐：",
                        style: TextStyle(
                            color: Color.fromRGBO(48, 48, 48, 1.0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 15.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/instruction/focusTraining');
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                              image: AssetImage('assets/tingge.png'),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 30.0),
                      child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0.0),
                          child: Image(
                              image: AssetImage('assets/shiqu.png'),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: 15.0, top: 30.0, left: 30.0, right: 30.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "课程：",
                        style: TextStyle(
                            color: Color.fromRGBO(48, 48, 48, 1.0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/instruction/aboutMusic1');
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 5.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/book.png'),
                          width: 28,
                          height: 28,
                        ),
                      ),
                      Text('音乐治疗金字塔',
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1.0),
                              fontSize: 14))
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFE7E7E7),
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/instruction/focusTraining');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/heartbeat.png'),
                          width: 28,
                          height: 28,
                        ),
                      ),
                      Text('注意力训练：听歌寻字',
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1.0),
                              fontSize: 14))
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFE7E7E7),
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 30.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/heartbeat.png'),
                          width: 28,
                          height: 28,
                        ),
                      ),
                      Text('听觉感知训练：识曲拍手',
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1.0),
                              fontSize: 14))
                    ],
                  ),
                ),
              )
            ])));
  }
}
