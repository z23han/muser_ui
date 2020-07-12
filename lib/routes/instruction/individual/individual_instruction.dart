import 'package:flutter/material.dart';
import 'package:muser_ui/services/coming_soon.dart';

class IndividualInstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double contentPositioner = size.height * (1 / 6);
    final String content = '慕斯个人指导正在测试，启用后将开通 音乐与情绪 、 心境保持 和 心境改变 等多门课程，敬请期待！';
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        SizedBox(height: contentPositioner),
        ComingSoon(passage: content, parentContext: context),
      ],
    )));
  }
}
