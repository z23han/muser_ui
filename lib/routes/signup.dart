import 'package:flutter/material.dart';
import 'package:muser_ui/models/user.dart';
import 'package:muser_ui/managers/user_manager.dart';

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
  bool isConsented = true;

  Future<void> signUp(BuildContext context) async {
    String name = _usernameController.text.trim();
    String password = _passwordController.text;
    String age = _ageController.text.trim();
    String city = _cityController.text.trim();
    String phone = _phoneController.text.trim();

    if (name.isEmpty ||
        password.isEmpty ||
        age.isEmpty ||
        city.isEmpty ||
        phone.isEmpty) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('您的填写信息不完整'),
            content: const Text('请重新尝试'),
            actions: <Widget>[
              FlatButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    if (phone.length != 11 ||
        double.tryParse(phone) == null ||
        double.tryParse(age) == null ||
        double.tryParse(age) <= 0 ||
        double.tryParse(age) >= 150) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('您的部分信息不正确'),
            content: const Text('请重新尝试'),
            actions: <Widget>[
              FlatButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    String gender = 'm';
    if (_gender == Gender.female) {
      gender = 'f';
    }

    User newUser = User(name, password, gender, age, phone, city, isConsented);
    bool checker = await UserManager.register(newUser);
    if (checker) {
      Navigator.pop(context);
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('注册成功'),
            content: const Text('请尝试登陆'),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('注册失败'),
            content: const Text('请尝试不同的用户名或手机号码'),
            actions: <Widget>[
              FlatButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          EdgeInsets.only(left: 28.0, right: 28.0, top: 108.0, bottom: 68.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "*用户名",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff343434),
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: Color(0xff343434),
                          height: 0.5,
                          thickness: 0.5,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ],
                    )),
                Spacer(flex: 1),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '*密码',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: Color(0xff343434),
                          height: 0.5,
                          thickness: 0.5,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ],
                    )),
              ],
            )),
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
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14),
                          ),
                          Radio(
                            value: Gender.male,
                            activeColor: Theme.of(context).accentColor,
                            focusColor: Theme.of(context).accentColor,
                            groupValue: _gender,
                            onChanged: (Gender value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          Text(
                            "女",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14),
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
                        ])),
                Spacer(flex: 1),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '*年龄',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: Color(0xff343434),
                          height: 0.5,
                          thickness: 0.5,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ],
                    )),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '*手机号',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 0),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: Color(0xff343434),
                  height: 0.5,
                  thickness: 0.5,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 68.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '*城市',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: Color(0xff343434),
                          height: 0.5,
                          thickness: 0.5,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ],
                    )),
                Spacer(
                  flex: 1,
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('返回',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
            FlatButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              splashColor: Theme.of(context).accentColor,
              onPressed: () {
                signUp(context);
              },
              child: Text('完成', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ],
    ));
  }
}
