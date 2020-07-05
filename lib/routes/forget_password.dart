import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

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
                        "密码找回",
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
                        "请输入手机号或验证码以找回或重置",
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right:38.0, left:38.0, top: 38.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '手机号',
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
                    controller: _codeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '验证码',
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
                        onPressed: () {Navigator.pushNamed(context, '/signin');},
                      ),
                      FlatButton(
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        splashColor: Colors.grey[600],
                        onPressed: () {
                          Navigator.pushNamed(context, '/resetPassword');
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