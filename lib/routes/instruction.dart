import 'package:flutter/material.dart';

class InstructionScreen extends StatefulWidget {
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 28.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "活动音乐：",
                    style: TextStyle(color: Color.fromRGBO(48, 48, 48, 1.0), fontSize: 16, fontWeight: FontWeight.bold),
                  )
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    // child: Padding(
                    //   padding: EdgeInsets.only(right: 15.0),
                    //   child: FlatButton(
                    //     onPressed: null,
                    //     padding: EdgeInsets.all(0.0),
                    //     child: Image(image: AssetImage('assets/shiqupaishou.png'), fit: BoxFit.fitWidth)
                    //   ),
                    // ),
                    child: Image(image: AssetImage('assets/shiqupaishou.png'), fit: BoxFit.fitWidth),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: FlatButton(
                        onPressed: null,
                        padding: EdgeInsets.all(0.0),
                        child: Image(image: AssetImage('assets/shiqupaishou.png'), fit: BoxFit.fitWidth)
                      ),
                    ),
                  )
                ],
              )
            ]
          )
        )
      )
    );
  }
}