import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class StoryPosts {
  String username;
  String tag;
  String postContent;
  String postImage;
  String postDateTime;

  StoryPosts(
      {this.username,
      this.tag,
      this.postContent,
      this.postImage,
      this.postDateTime});

  // Future<void> _getPost() async {
  //   try {
  //     //TODO: get story post link
  //     // Response res = await get('LINK');
  //     // Map data = jsonDecode(res.body);
  //     // username = data['username'];
  //     // tag = data['tag'];
  //     // postContent = data['postContent'];
  //     // postImage = data['postImage'];
  //     // String dateTime = data['postDateTime'];

  //     // DateTime dateTimeRaw = DateTime.parse(dateTime);
  //     // DateTime now = DateTime.now();
  //     // postDateTime = now.year != dateTimeRaw.year
  //     //     ? DateFormat.yMd().add_Hm().format(dateTimeRaw)
  //     //     : now.month != dateTimeRaw.month || now.day != dateTimeRaw.month
  //     //         ? DateFormat.Md().add_Hm().format(dateTimeRaw)
  //     //         : now.hour != dateTimeRaw.hour
  //     //             ? '${now.hour - dateTimeRaw.hour}小时前'
  //     //             : now.minute != dateTimeRaw.minute
  //     //                 ? '${now.minute - dateTimeRaw.minute}分钟前'
  //     //                 : '${now.second - dateTimeRaw.second}秒前';
  //   } catch (e) {
  //     print('caught error: $e');
  //   }
  // }
}
