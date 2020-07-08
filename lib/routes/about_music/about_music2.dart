import 'package:flutter/material.dart';

class AboutMusic2 extends StatefulWidget {
  @override
  _AboutMusic2State createState() => _AboutMusic2State();
}

class _AboutMusic2State extends State<AboutMusic2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context, '/musicBase',
                arguments: {
                  'pageIndex': 1
                }
              );
            },
            child: Image(image: AssetImage('assets/cross.png'), width: 24, height: 24,),
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Image(image: AssetImage('assets/p2.png'), fit: BoxFit.fitWidth,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Image(image: AssetImage('assets/book.png'), width: 28, height: 28,),
                  ),
                  Text('音乐治疗金字塔', style: TextStyle(color: Color.fromRGBO(48, 48, 48, 1.0), fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 30.0, left: 20, right: 20),
              child: Text(
                "促进型音乐治疗专注于促进健康及多方面的健康目标，包括肢体、认知、情感、人际关系，以及个人发展。\n\n音乐治疗师或者受过音乐治疗培训的人员都是担任这项指导工作的适合人选。\n\n帮助孩子们从疫情影响中恢复身心健康的武汉前进计划，就是属于该类型的促进型音乐治疗。",
                style: TextStyle(color: Color.fromRGBO(48, 48, 48, 1.0), fontSize: 14),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context, '/aboutMusic1',
                        );
                      },
                      child: Image(image: AssetImage('assets/backward.png'), width: 34, height: 34,),
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      splashColor: Colors.grey[600],
                      onPressed: () {
                        Navigator.pushNamed(
                          context, '/musicBase',
                          arguments: {
                            'pageIndex': 1
                          }
                        );
                      },
                      child: Text('完成', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ) 
          ]
        ),
      )
    );
  }
}