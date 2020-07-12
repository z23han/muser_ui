import 'package:flutter/material.dart';
import 'package:muser_ui/services/coming_soon.dart';

class AuditoryPerception extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double contentPositioner = size.height * (1 / 5);
    final String content = '慕斯听觉感知训练正在测试，启用后将可以通过 识曲拍手 的活动体验音乐疗愈，敬请期待！';
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0,
            title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: <Widget>[
                  //go back button
                  IconButton(
                      icon: Icon(Icons.arrow_back,
                          size: 24, color: Theme.of(context).buttonColor),
                      onPressed: () => Navigator.of(context).pop()),
                ]))),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: contentPositioner),
            ComingSoon(passage: content, parentContext: context),
          ],
        )));
  }
}
