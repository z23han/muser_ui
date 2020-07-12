import 'package:flutter/material.dart';
import 'package:muser_ui/routes/music/music_list.dart';
import 'package:muser_ui/models/music_category.dart';
import 'package:muser_ui/utils/music_constants.dart';

class MusicScreen extends StatefulWidget {
  final int tabIndex;
  const MusicScreen({this.tabIndex});
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with TickerProviderStateMixin {
  final List<MusicCategory> musicCategoryList =
      MusicConstants.musicCategoryList;

  final List<Widget> _children = [
    MusicListScreen(categoryId: 0),
    MusicListScreen(categoryId: 1),
    MusicListScreen(categoryId: 2),
    MusicListScreen(categoryId: 3),
  ];
  TabController _tabController;
  @override
  void initState() {
    _tabController =
        TabController(vsync: this, length: 4, initialIndex: widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double tabWidth = size.width * (30 / 360);
    return DefaultTabController(
      length: musicCategoryList.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 15,
          title: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Theme.of(context).accentColor,
                  indicatorWeight: 2,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 16),
                  tabs: musicCategoryList
                      .map((e) => Container(
                          width: tabWidth, child: Tab(text: e.category)))
                      .toList())
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: _children),
      ),
    );
  }
}
