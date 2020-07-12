import 'package:flutter/material.dart';
import 'package:muser_ui/services/coming_soon.dart';

class AboutMuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double contentPositioner = size.height * (1 / 15);
    final String content =
        'Muser是基于可穿戴装备及数据分析的新型音乐治疗服务提供者，旨在提供可量化的音乐治疗以提高治疗效能和更个性化的治疗体验。\n我们利用先进的机器学习算法分析音乐的特点及使用者在聆听音乐时的生理表征，比如心率和体温，以推荐具实际减压效果和更个人化的音乐体验。\n在“向前迈进”计划里，Muser将推展这项科技帮助受新冠和居家隔离安排影响的约50,000名学生，帮助他们尽快心理健康恢复。';
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
