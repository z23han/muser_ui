import 'package:flutter/material.dart';
import 'package:muser_ui/services/music_category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MusicCategoryScroller musicCategoryScroller = MusicCategoryScroller();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color wrapColor = Colors.grey[300];
    final double moduleTitleFontSize = 20;
    final Color moduleTitleColor = Colors.grey[800];
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Row(
              children: <Widget>[
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('晚上好，\n薯条',
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 20)),
                  ),
                  flex: 1,
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(height: 30),
            Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    color: wrapColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('音乐库',
                          style: TextStyle(
                              color: moduleTitleColor,
                              fontSize: moduleTitleFontSize)),
                      SizedBox(height: 20),
                      musicCategoryScroller,
                    ],
                  ),
                )),
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        print('个人疗愈 was tapped');
                      },
                      child: Container(
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: wrapColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('个人疗愈',
                                    style: TextStyle(
                                        fontSize: moduleTitleFontSize,
                                        color: moduleTitleColor))),
                          ))),
                  InkWell(
                      onTap: () {
                        print('小组疗愈 was tapped');
                      },
                      child: Container(
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: wrapColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('小组疗愈',
                                    style: TextStyle(
                                        fontSize: moduleTitleFontSize,
                                        color: moduleTitleColor))),
                          ))),
                ]),
            SizedBox(height: 30),
            InkWell(
                onTap: () {
                  print('慕斯故事 was tapped');
                },
                child: Container(
                    height: size.height * 0.425,
                    decoration: BoxDecoration(
                        color: wrapColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('慕斯故事',
                              style: TextStyle(
                                  fontSize: moduleTitleFontSize,
                                  color: moduleTitleColor))),
                    ))),
            SizedBox(height: 30),

            //TODO: End of homepage, should add some additional info
            Container()
          ],
        ),
      ),
    ));
  }
}

class MusicCategoryScroller extends StatelessWidget {
  //TODO: extract music categories from database in the future
  final List<MusicCategory> musicCategory = [
    MusicCategory(category: '平静', image: '平静.png'),
    MusicCategory(category: '专注', image: '专注.png'),
    MusicCategory(category: '睡眠', image: '睡眠.png'),
    MusicCategory(category: '激活', image: '激活.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = (size.width - 20 * 2 - 20 * 2 - 10 * 3) / 4;
    final double height = width * 2.2;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
            child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(
                    children: musicCategory
                        .map((i) => InkWell(
                              onTap: () {
                                print('${i.category} was tapped');
                              },
                              child: Container(
                                  width: width,
                                  height: height,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    // image: DecorationImage(
                                    //     image: AssetImage(i.image),
                                    //     fit: BoxFit.cover)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(i.category,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                  )),
                            ))
                        .toList()))));
  }
}
