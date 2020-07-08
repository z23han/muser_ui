import 'package:flutter/material.dart';

class AboutMusic1 extends StatefulWidget {
  @override
  _AboutMusic1State createState() => _AboutMusic1State();
}

class _AboutMusic1State extends State<AboutMusic1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
              child: Image(image: AssetImage('assets/p1.png'), fit: BoxFit.fitWidth,),
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
            Image(image: AssetImage('assets/pyramid.png'), fit: BoxFit.fitWidth,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('Pizzi的音乐治疗金字塔模型', style: TextStyle(color: Color.fromRGBO(48, 48, 48, 1.0), fontSize: 18, fontWeight: FontWeight.w500))
            ),
            ButtonBar(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context, '/aboutMusic2',
                    );
                  },
                  child: Image(image: AssetImage('assets/forward.png'), width: 34, height: 34,),
                ),
              ],
            )
          ]
        ),
      )
    );
  }
}