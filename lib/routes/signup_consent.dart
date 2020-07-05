import 'package:flutter/material.dart';

class SignUpConsent extends StatefulWidget {
  @override
  _SignUpConsentState createState() => _SignUpConsentState();
}

class _SignUpConsentState extends State<SignUpConsent> {
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
                        "慕斯 (Muser) 保密政策",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0, left: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "慕斯 将会:",
                        style: TextStyle(color: Colors.grey[400], fontSize: 22),
                      ),
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right:38.0, left:38.0, top: 18.0),
                  child: Text(
                    "在使用品（或服）前，仔并了解《隐私权政策》如您有任何疑，可通或方式得帮助。一旦您点“同意”本私权政策，我将您充分理解并同意本私权政策。\n【慕斯】深知个人信息您的重要性，恪守以下原：权一致原、目的明确原、同意原、最少够用原、确保安全原、公开透明。措施来保您的个人信息了向您提供服，系将框提示，建您允取相关权限。",
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
                                '信息权限',
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
                                '相机权限',
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
                                '存取权限',
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
                        onPressed: () {Navigator.pushNamed(context, '/signin');},
                      ),
                      FlatButton(
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        splashColor: Colors.grey[600],
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
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