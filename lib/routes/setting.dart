import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final List<String> settingButton = ['帮助与反馈', '关于慕斯', '退出登录'];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(titleSpacing: size.width / 2 - 80, title: Text('设置')),
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
                      child: FlatButton(
                          onPressed: () {},
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          child: Container(
                              width: size.width - 30 * 2,
                              height: 50,
                              child: Center(
                                child: Text('退出登录',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 16)),
                              ))),
                    ),
                  )));
  }
}