import 'package:flutter/material.dart';
import 'package:muser_ui/routes/instruction/group/about_music1.dart';

class AboutMusic2 extends StatefulWidget {
  @override
  _AboutMusic2State createState() => _AboutMusic2State();
}

class _AboutMusic2State extends State<AboutMusic2> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * (88 / 360);
    final double buttonHeight = buttonWidth * (36 / 88);
    final double arrowSize = size.width * (34 / 360);
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                image: AssetImage('assets/p2of2.png'),
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
            Padding(
              padding:
                  EdgeInsets.only(top: 15.0, bottom: 30.0, left: 20, right: 20),
              child: Text(
                "促进型音乐治疗专注于促进健康及多方面的健康目标，包括肢体、认知、情感、人际关系，以及个人发展。\n\n音乐治疗师或者受过音乐治疗培训的人员都是担任这项指导工作的适合人选。\n\n帮助孩子们从疫情影响中恢复身心健康的武汉前进计划，就是属于该类型的促进型音乐治疗。",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 16),
              ),
            ),
            Spacer(flex: 1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                          Navigator.popUntil(context, ModalRoute.withName('/musicBase'));
                        },
                        child: Text('完成',
                            style: Theme.of(context).textTheme.button)),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * (55 / 640)),
          ]),
        ));
  }
}
