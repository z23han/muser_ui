import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String passage;
  final BuildContext parentContext;
  const ComingSoon({this.passage, this.parentContext});

  @override
  Widget build(BuildContext context) {
    return _buildComingSoonContent(parentContext, passage);
  }

  Container _buildComingSoonContent(BuildContext context, String content) {
    final Size size = MediaQuery.of(context).size;
    final double contentWidth = size.width * (250 / 360);
    return Container(
      width: contentWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
            Image(image: AssetImage('assets/bg_coming_soon2.png'), width: 80),
            Image(image: AssetImage('assets/bg_coming_soon1.png'), width: 80),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 45, right: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(passage,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 16)),
                Text('\n-- 慕斯团队',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 14))
              ],
            ),
          )
        ],
      ),
    );
  }
}
