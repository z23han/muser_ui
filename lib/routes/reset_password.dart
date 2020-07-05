import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _recodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  child: Padding(
                    padding: EdgeInsets.only(right:28.0, left:28.0, top: 28.0, bottom: 28.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "验证成功",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0, left: 38.0, right: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "请重置密码",
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right:38.0, left:38.0, top: 38.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '新密码',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700]               
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:38.0, left:38.0, top: 28.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _recodeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '新密码确认',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700]            
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:28.0, left:28.0, top: 38.0, bottom: 18.0),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('取消', style: TextStyle(fontSize: 18, color: Colors.grey[500], decoration: TextDecoration.underline,)),
                        onPressed: () {Navigator.pushNamed(context, '/forgetPassword');},
                      ),
                      FlatButton(
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        splashColor: Colors.grey[600],
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text('确认', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}