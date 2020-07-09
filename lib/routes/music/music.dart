import 'package:flutter/material.dart';
import 'package:muser_ui/routes/music/music_list.dart';
import 'package:muser_ui/services/music_categories.dart';
import 'package:muser_ui/utils/music_constants.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<MusicCategories> musicCategoryList =
      MusicConstants.musicCategoryList;

  List<Tab> _getMusicCategoryTabs() {
    List<Tab> tabList = new List<Tab>();
    for (var musicCategory in musicCategoryList) {
      tabList.add(new Tab(
        text: musicCategory.category,
      ));
    }
    return tabList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: musicCategoryList.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new TabBar(
                tabs: _getMusicCategoryTabs(),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MusicListScreen(categoryId: 0),
            MusicListScreen(categoryId: 1),
            MusicListScreen(categoryId: 2),
            MusicListScreen(categoryId: 3),
          ],
        ),
      ),
    );
  }
}
