import 'package:flutter/material.dart';
import 'package:muser_ui/managers/post_manager.dart';
import 'package:muser_ui/models/story_post.dart';
import 'package:intl/intl.dart';

class StoryPostList extends StatefulWidget {
  final int themeId;
  const StoryPostList({this.themeId});

  @override
  _StoryPostListState createState() => _StoryPostListState();
}

class _StoryPostListState extends State<StoryPostList> {
  final PostManager _postManager = PostManager();
  List<StoryPost> _postlist;

  void _populatePostMap() {
    _postlist = _postManager.getThemePost(widget.themeId);
  }

  @override
  Widget build(BuildContext context) {
    _populatePostMap();
    return Container(
        child: Column(
      children: _buildPostList(),
    ));
  }

  List<GestureDetector> _buildPostList() {
    final Size size = MediaQuery.of(context).size;
    final double postImageSize = size.width * (50 / 360);
    final double postContentWidth = size.width - postImageSize - 30 * 2 - 30;
    final double postUserAvatarSize = size.width * (16 / 360);
    return _postlist
        .map((e) => GestureDetector(
              onTap: () {},
              child: Container(
                width: size.width,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: postUserAvatarSize,
                                backgroundImage: AssetImage(
                                    'assets/avatar_muser_assistant.png'),
                              ),
                              SizedBox(width: 15),
                              Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: <Widget>[
                                  Text(e.username,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                  Text(_formatTime(e.postDateTime),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(fontSize: 12))
                                ],
                              ),
                            ],
                          ),
                          Text('#' + e.tag,
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18))
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: postContentWidth,
                            child: Text(e.postContent,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                          Container(
                            width: postImageSize,
                            height: postImageSize,
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
              ),
            ))
        .toList();
  }

  String _formatTime(String time) {
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
