import 'package:flutter/material.dart';
import 'package:muser_ui/services/story_themes.dart';
import 'package:muser_ui/services/story_posts.dart';
import 'package:muser_ui/utils/story_constants.dart';

//import for temporary constants
import 'package:muser_ui/utils/post_constants.dart';

//import for temporary helper
import 'package:intl/intl.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryThemeScroller storyThemeScroller = StoryThemeScroller();
  final StoryPostsBuilder storyPostsBuilder = StoryPostsBuilder();
  //TODO: save posts and post to database
  // final savedPosts = Set<StoryPosts>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 0, 30),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    Text('慕斯主题',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    storyThemeScroller
                  ],
                ),
              )),
          storyPostsBuilder
        ],
      ),
    ));
  }
}

class StoryThemeScroller extends StatelessWidget {
  // TODO: get story themes from database
  final List<StoryThemes> storyTheme = StoryConstants.storyThemeList;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = (size.width - 30 - 15 * 3) / 3 - 5;
    final double height = width;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
            child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(
                    children: storyTheme
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: InkWell(
                                onTap: () {},
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: width,
                                        height: height,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/${e.coverImage}'),
                                                fit: BoxFit.cover))),
                                    Text(e.storyTheme)
                                  ],
                                ),
                              ),
                            ))
                        .toList()))));
  }
}

class StoryPostsBuilder extends StatelessWidget {
  final List<StoryPosts> posts = PostConstants.postList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
        children: posts
            .map((e) => Container(
                  width: size.width,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                            SizedBox(width: 15),
                            Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: <Widget>[
                                Text(e.username,
                                    style: TextStyle(
                                        color: Color(0xff343434),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(_t(e.postDateTime),
                                    style: TextStyle(
                                        color: Color(0xffc7c7c7), fontSize: 12))
                              ],
                            ),
                            Spacer(flex: 1),
                            Text('#' + e.tag,
                                style: TextStyle(
                                    color: Color(0xff4fa3c2), fontSize: 18))
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Text(e.postContent,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                            Spacer(flex: 1),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/post_image.png'),
                                    fit: BoxFit.cover),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))
            .toList());
  }

  //Temporary helper to format post date time
  String _t(String time) {
    DateTime dateTimeRaw = DateTime.parse(time);
    DateTime now = DateTime.now();
    return now.year != dateTimeRaw.year
        ? DateFormat.yMd().add_Hm().format(dateTimeRaw)
        : now.month != dateTimeRaw.month || now.day != dateTimeRaw.day
            ? DateFormat.Md().add_Hm().format(dateTimeRaw)
            : now.hour != dateTimeRaw.hour
                ? '${now.hour - dateTimeRaw.hour}小时前'
                : now.minute != dateTimeRaw.minute
                    ? '${now.minute - dateTimeRaw.minute}分钟前'
                    : '${now.second - dateTimeRaw.second}秒前';
  }
}
