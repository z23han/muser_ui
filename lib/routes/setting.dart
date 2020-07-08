import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final List<String> settingButton = ['帮助与反馈', '关于慕斯', '退出登录'];
  @override
  Widget build(BuildContext context) {
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
            itemCount: settingButton.length,
            itemBuilder: (context, index) => index != settingButton.length - 1
                ? ListTile(
                    leading: Text(settingButton[index],
                        style: Theme.of(context)
                            .textTheme
                            .headline1
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/loader', (route) => false);
                            },
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            child: Center(
                              child: Text('退出登录',
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
