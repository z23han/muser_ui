import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

enum Gender { male, female }

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 108.0, bottom: 68.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 68.0),
            child: Text(
              "慕斯 (Muser) 个人信息注册",
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '用户名',
                      contentPadding: EdgeInsets.only(bottom: 0),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],            
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '密码',
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700]            
                    ),
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "男",
                        style: TextStyle(color: Colors.grey[500], fontSize: 18),
                      ),
                      Radio(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Text(
                        "女",
                        style: TextStyle(color: Colors.grey[500], fontSize: 18),
                      ),
                      Radio(
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ]
                  )
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '年龄',
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700]            
                    ),
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: '手机号',
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700]               
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 68.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '城市',
                      contentPadding: EdgeInsets.only(bottom: 0),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],            
                    ),
                  ),
                ),
                Spacer(flex: 1,),
                Spacer(flex: 5,),
              ],
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child:GestureDetector(
                  onTap: () {Navigator.pushNamed(context, '/signUpConsent');},
                  child: Text('返回', style: TextStyle(fontSize: 18, color: Colors.grey[500], decoration: TextDecoration.underline,)),
                ),
              ),
              FlatButton(
                color: Colors.grey[600],
                textColor: Colors.white,
                splashColor: Colors.grey[600],
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('完成', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ],
      )
    );
  }
}