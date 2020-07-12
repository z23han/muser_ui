import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:muser_ui/managers/user_manager.dart';
import 'package:muser_ui/routes/about_muser.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<String> buttonName = ['关于Muser', '退出登录'];
  HashMap<int, Widget> buttonMap = HashMap();

  void _populateMap() {
    buttonMap.putIfAbsent(0, () => AboutMuser());
  }

  @override
  Widget build(BuildContext context) {
    _populateMap();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: <Widget>[
                  //go back button
                  IconButton(
                      icon: Icon(Icons.arrow_back,
                          size: 24, color: Theme.of(context).buttonColor),
                      onPressed: () => Navigator.of(context).pop()),
                  SizedBox(width: size.width / 2 - 85),
                  Text('设置')
                ])),
            titleSpacing: 0),
        body: ListView.builder(
            itemCount: buttonName.length,
            itemBuilder: (context, index) => index != buttonName.length - 1
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => buttonMap[index]));
                    },
                    leading: Text(buttonName[index],
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 16)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        width: size.width - 30 * 2,
                        height: 50,
                        child: FlatButton(
                            onPressed: () {
                              UserManager.removeUserToken();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/signin', (route) => false);
                            },
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            child: Center(
                              child: Text(buttonName[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 16)),
                            )),
                      ),
                    ),
                  )));
  }
}
