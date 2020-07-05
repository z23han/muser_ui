import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './music.dart';
import './instruction.dart';
import './story.dart';
import './my_account.dart';

// access to global variables
GetIt getIt = GetIt.instance;

class MusicBase extends StatefulWidget {
  @override
  _MusicBaseState createState() => _MusicBaseState();
}

class _MusicBaseState extends State<MusicBase> {
  int _currentIndex = 0;
  int isLanding = 1;
  final List<Widget> _children = [
    MusicScreen(),
    InstructionScreen(),
    StoryScreen(),
    MyAccountScreen()
  ];
  final List<String> _leading = ['音乐', '指导', '故事', '我的'];
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Temporarily used to set auth_token to default value.
    getIt<FlutterSecureStorage>().delete(key: 'auth_token');

    // TODO: get user data retrieved from database besides the page index
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    if (isLanding > 0) {
      _currentIndex = data['pageIndex'];
      isLanding--;
    }
    return Scaffold(
        //App bar
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0,

          title: Row(
            children: <Widget>[
              //title of subpage
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: Text(_leading[_currentIndex],
                    style: TextStyle(fontSize: 22)),
              ),

              //search bar
              Expanded(
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: 35,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          print('Search bar was tapped');
                          showSearch(context: context, delegate: DataSearch());
                        },
                        child: Container(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.search,
                                    size: 18, color: Colors.grey[200]),
                                Text('搜索:慕斯音乐 指导 以及故事',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[200]))
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          //trailing button for specific subpage
          actions: <Widget>[
            _currentIndex == 3
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: IconButton(
                        icon: Icon(Icons.settings,
                            size: 24, color: Theme.of(context).accentColor),
                        onPressed: () {}),
                  )
                : SizedBox(width: 36)
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: _children[_currentIndex],

        //bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 30,
            selectedItemColor: Colors.teal[400],
            unselectedItemColor: Colors.grey[400],
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.double_music_note),
                  title: Text('音乐')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_video), title: Text('指导')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), title: Text('故事')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('我的'))
            ]));
  }
}

//Search functionality
class DataSearch extends SearchDelegate<String> {
  DataSearch() : super(searchFieldLabel: '搜索慕斯');
  // TODO: get user recent search history for search suggestions
  final searchSuggestionList = [
    'search suggestion1',
    'search suggestion2',
    'search suggestion3',
    'search suggestion4',
    'search suggestion5',
    'search suggestion6',
    'search suggestion7',
    'search suggestion8',
    'search suggestion9',
  ];

  // TODO: get real-time search results that match user's input
  final matchResultsList = [
    'match result1',
    'match result2',
    'match result3',
    'match result4',
    'match result5',
    'match result6',
    'match result7',
    'match result8',
    'match result9',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FlatButton(
          onPressed: () {
            close(context, null);
          },
          child: Text('取消', style: Theme.of(context).textTheme.button))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
        child: FlatButton(
            child: Text('返回'),
            onPressed: () {
              close(context, null);
            }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchingDisplayList = query.isEmpty
        ? searchSuggestionList
        : matchResultsList.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchingDisplayList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 30, 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Text('$index',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold)),
                  ),
                  RichText(
                      text: TextSpan(
                          text: searchingDisplayList[index]
                              .substring(0, query.length),
                          style: TextStyle(
                              color: Colors.tealAccent[400], fontSize: 16),
                          children: [
                        TextSpan(
                            text: searchingDisplayList[index]
                                .substring(query.length),
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[800]))
                      ])),
                ],
              ),
            ));
  }
}
