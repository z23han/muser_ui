import 'package:flutter/material.dart';
import 'package:muser_ui/services/music_categories.dart';
import 'package:muser_ui/utils/music_constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  final MusicCategoryScroller musicCategoryScroller = MusicCategoryScroller();

  @override
  Widget build(BuildContext context) {
    //TODO: get user data from database
    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    final Size size = MediaQuery.of(context).size;
    final double widthInstruction = (size.width - 30 * 2 - 20) / 2;
    final double heightInstruction = widthInstruction * (93 / 141);
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      _getGreeting() + '，\n薯条',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: size.width * (24 / 360),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).accentColor.withOpacity(0.5),
                          decorationThickness: 5),
                    ),
                    Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/musicBase',
                            arguments: {'pageIndex': 3});
                      },
                      child: CircleAvatar(
                          radius: size.width * (36 / 360),
                          backgroundImage: AssetImage('assets/avatar.png')),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('音乐馆',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            musicCategoryScroller,
                            SizedBox(height: 30),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: <Widget>[
                                          Text('个人疗愈',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          SizedBox(height: 15),
                                          InkWell(
                                              onTap: () {
                                                print('个人疗愈 was tapped');
                                                Navigator.pushNamed(
                                                    context, '/musicBase',
                                                    arguments: {
                                                      'pageIndex': 1
                                                    });
                                              },
                                              child: Container(
                                                height: heightInstruction,
                                                width: widthInstruction,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Instruction_Individual.png'),
                                                        fit: BoxFit.cover)),
                                              )),
                                        ]),
                                  ),
                                  Container(
                                    child: Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: <Widget>[
                                          Text('小组疗愈',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          SizedBox(height: 15),
                                          InkWell(
                                              onTap: () {
                                                print('小组疗愈 was tapped');
                                                Navigator.pushNamed(
                                                    context, '/musicBase',
                                                    arguments: {
                                                      'pageIndex': 1
                                                    });
                                              },
                                              child: Container(
                                                height: heightInstruction,
                                                width: widthInstruction,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(3),
                                                    ),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Instruction_Group.png'),
                                                        fit: BoxFit.cover)),
                                              )),
                                        ]),
                                  )
                                ]),
                            SizedBox(height: 30),
                            Text('慕斯故事',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(height: 15),
                            InkWell(
                                onTap: () {
                                  print('慕斯故事 was tapped');
                                  Navigator.pushNamed(context, '/musicBase',
                                      arguments: {'pageIndex': 2});
                                },
                                child: Container(
                                    height: (size.width - 30 * 2) * (200 / 300),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/MuserStory.png'),
                                                    fit: BoxFit.cover))),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 20, 0, 0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            child: Container(
                                                height: 30,
                                                width: size.width * (180 / 360),
                                                alignment: Alignment.center,
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 0.5),
                                                child: Text('当我谈论吉他时我在谈些什么',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1
                                                        .copyWith(
                                                            fontSize: 14))),
                                          ),
                                        )
                                      ],
                                    ))),
                            SizedBox(height: 30),
                          ],
                        ),
                      ))),
            ],
          ),
        ));
  }

  String _getGreeting() {
    int hour = DateTime.now().hour;
    print(hour);
    return hour > 18 && hour < 22
        ? '晚上好'
        : hour >= 22 || hour < 6
            ? '晚安'
            : hour >= 6 && hour < 9
                ? '早'
                : hour >= 9 && hour < 12
                    ? '上午好'
                    : hour >= 12 && hour < 14 ? '午安' : '下午好';
  }
}

class MusicCategoryScroller extends StatelessWidget {
  //TODO: extract music categories from database in the future
  final List<MusicCategories> musicCategory = MusicConstants.musicCategoryList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = (size.width - 30 * 2 - 15 * 3) / 4;
    final double height = width * (95 / 63);
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: musicCategory
                .map((e) => InkWell(
                      onTap: () {
                        print('${e.category} was tapped');
                        Navigator.pushNamed(context, '/musicBase',
                            arguments: {'pageIndex': 0});
                      },
                      child: Container(
                        width: width,
                        height: height,
                        margin: EdgeInsets.only(right: 15),
                        child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/${e.coverImage}'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                  height: height * (25 / 95),
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 0.2),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3))),
                                  child: Center(
                                    child: Text(e.category,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ))
                            ]),
                      ),
                    ))
                .toList()));
  }
}
