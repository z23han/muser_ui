import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './music/music.dart';
import './instruction/instruction.dart';
import './muser_story/story.dart';
import './my_account/my_account.dart';

// access to global variables
GetIt getIt = GetIt.instance;

//tabs for bottom nav bar
enum _Tab { TAB1, TAB2, TAB3, TAB4 }

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
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                //go back button
                IconButton(
                    icon: Icon(Icons.arrow_back,
                        size: 24, color: Theme.of(context).buttonColor),
                    onPressed: () => Navigator.of(context).pop()),

                //title of subpage
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(_getCurScreenTitle(_Tab.values[_currentIndex]),
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 22))),

                //search bar
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        print('Search bar was tapped');
                        showSearch(context: context, delegate: DataSearch());
                      },
                      child: Container(
                          color: Theme.of(context).accentColor.withOpacity(0.5),
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.search, size: 18, color: Colors.white),
                              Text('搜索:音乐 指导 以及故事',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white))
                            ],
                          )),
                    ),
                  ),
                ),
                _getCurAppBarButton(_Tab.values[_currentIndex])
              ],
            ),
          ),
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
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Color(0xff666666),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: _Tab.values
                .map((_Tab tab) => BottomNavigationBarItem(
                    title: Text(_getCurScreenTitle(tab)),
                    icon: Image.asset(_getCurBNBIcon(tab), scale: 8)))
                .toList()));
  }

  Widget _getCurAppBarButton(_Tab tab) {
    return
        // tab == _Tab.TAB3
        //     ? IconButton(
        //         icon: Icon(Icons.create,
        //             size: 24, color: Theme.of(context).buttonColor),
        //         onPressed: () {})
        //     :
        tab == _Tab.TAB4
            ? IconButton(
                icon: Icon(Icons.settings,
                    size: 24, color: Theme.of(context).buttonColor),
                onPressed: () {
                  Navigator.pushNamed(context, '/setting');
                })
            : SizedBox(width: 15);
  }

  String _getCurScreenTitle(_Tab tab) {
    return tab == _Tab.TAB1
        ? '音乐'
        : tab == _Tab.TAB2 ? '指导' : tab == _Tab.TAB3 ? '故事' : '我的';
  }

  String _getCurBNBIcon(_Tab tab) {
    final isActive = tab == _Tab.values[_currentIndex];
    if (tab == _Tab.TAB1) {
      return isActive
          ? 'assets/BNBIcon_Music_selected.png'
          : 'assets/BNBIcon_Music.png';
    } else if (tab == _Tab.TAB2) {
      return isActive
          ? 'assets/BNBIcon_Instruction_selected.png'
          : 'assets/BNBIcon_Instruction.png';
    } else if (tab == _Tab.TAB3) {
      return isActive
          ? 'assets/BNBIcon_Story_selected.png'
          : 'assets/BNBIcon_Story.png';
    } else {
      return isActive
          ? 'assets/BNBIcon_Account_selected.png'
          : 'assets/BNBIcon_Account.png';
    }
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
          child: Text('取消',
              style:
                  Theme.of(context).textTheme.headline1.copyWith(fontSize: 20)))
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
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                  RichText(
                      text: TextSpan(
                          text: searchingDisplayList[index]
                              .substring(0, query.length),
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16),
                          children: [
                        TextSpan(
                            text: searchingDisplayList[index]
                                .substring(query.length),
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(fontSize: 16))
                      ])),
                ],
              ),
            ));
  }
}
