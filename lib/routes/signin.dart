import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// access to global variables
GetIt getIt = GetIt.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    String token = 'fake_token';
    var username = _usernameController.text;
    var password = _passwordController.text;
    print('username: $username, password: $password');
    // Anything is written by Flutter Secure Storage will not be reset, even you rerun the debugger.
    // TODO: get token by given username and password.
    getIt<FlutterSecureStorage>().write(key: 'auth_token', value: token)
      .then((result) => Navigator.pushNamed(context, '/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(
                left: 28.0, right: 28.0, top: 48.0, bottom: 48.0),
            child: ListView(padding: EdgeInsets.all(0), children: [
              Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text('English', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text('跳过',
                          style: TextStyle(
                          color: Colors.grey[500], fontSize: 14)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('开启你的\n音乐瑜伽\n之旅', style: TextStyle(color: Colors.grey[500], fontSize: 20))
                      )
                    ),
                    Spacer(flex: 1),
                  ]
                )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding (
                    padding: EdgeInsets.only(right: 10),
                    child:Icon(Icons.person_outline, color: Colors.grey[400], size: 30)
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text('账号', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(height: 20, child: VerticalDivider(color: Colors.grey[500], width: 0, thickness: 1)),
                  ),
                  Expanded (
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: '用户名/手机号',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        border: InputBorder.none,
                      ),
                    )
                  )
                ]
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Divider(
                  color: Colors.grey[500],
                  height: 0,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.lock_outline,
                            color: Colors.grey[400], size: 30)),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('密码',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 14)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                          height: 20,
                          child: VerticalDivider(
                              color: Colors.grey[500], width: 0, thickness: 1)),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '******',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Divider(
                  color: Colors.grey[500],
                  height: 0,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Spacer(flex: 6),
                    Expanded(
                      flex: 1,
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Colors.grey[600],
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(Icons.arrow_forward, size: 30),
                          color: Colors.white,
                          onPressed: () {
                            login();
                          },
                        ),
                      )
                    )
                  ]
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('其他登陆方式', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child:Ink(
                        width: 40.0,
                        height: 40.0,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(Icons.chat_bubble, size: 25),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/weChatConsent');
                          },
                        ),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Ink(
                        width: 40.0,
                        height: 40.0,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(Icons.smartphone, size: 25),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Spacer(flex: 5)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:GestureDetector(
                        onTap: () {Navigator.pushNamed(context, '/signUpConsent');},
                        child: Text('我要注册', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Container(height: 15, child: VerticalDivider(color: Colors.grey[500], width: 0, thickness: 1)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:GestureDetector(
                        onTap: () {Navigator.pushNamed(context, '/forgetPassword');},
                        child: Text('忘记密码', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                      ),
                    )
                  ),
                  Spacer(),
                ]
              )
            ]
          )
        )
      );
  }
}
