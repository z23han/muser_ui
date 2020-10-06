import 'package:flutter/material.dart';

class WeChatConsent extends StatefulWidget {
  @override
  _WeChatConsentState createState() => _WeChatConsentState();
}

class _WeChatConsentState extends State<WeChatConsent> {
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
                        "微信 第三方登陆授权",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Ink(
                    width: 100.0,
                    height: 100.0,
                    decoration: ShapeDecoration(
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: Icon(Icons.chat_bubble, size: 70),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:38.0, left:38.0, top: 18.0),
                  child: Text(
                    "【慕斯】深知个人信息您的重要性，恪守以下原则：最少够用原则、确保安全原则、公开透明措施来确保您的个人信息了向您提供服，系将框提示，建您允取相关权限。",
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:28.0, left:28.0, top: 18.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey[400]),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('1', style: TextStyle(fontSize: 14, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '姓名、用名',
                                style: TextStyle(fontSize: 14, color: Colors.grey[500])
                              )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey[400]),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('2', style: TextStyle(fontSize: 14, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '投像途片',
                                style: TextStyle(fontSize: 14, color: Colors.grey[500])
                              )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey[400]),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('3', style: TextStyle(fontSize: 14, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '手机号',
                                style: TextStyle(fontSize: 14, color: Colors.grey[500])
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right:28.0, left:28.0, top: 18.0, bottom: 28.0),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('取消', style: TextStyle(fontSize: 18, color: Colors.grey[500], decoration: TextDecoration.underline,)),
                        onPressed: () {Navigator.pop(context);},
                      ),
                      FlatButton(
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        splashColor: Colors.grey[600],
                        onPressed: () {
                          // add wechat login functionality
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text('同意', style: TextStyle(fontSize: 18)),
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