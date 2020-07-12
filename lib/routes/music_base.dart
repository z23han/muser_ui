import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:collection';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './music/music.dart';
import './instruction/instruction.dart';
import './muser_story/story.dart';
import './my_account/my_account.dart';
import 'package:muser_ui/services/search_service.dart';

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
  int _tabIndex = 0;
  HashMap<int, List<Widget>> _children = HashMap();

  // final List<Widget> _childrenf = [
  //   MusicScreen(),
  //   InstructionScreen(),
  //   StoryScreen(),
  //   MyAccountScreen()
  // ];
  Map data = {};

  void _populateChildrenMap() {
    _children.putIfAbsent(
        0,
        () => [
              MusicScreen(tabIndex: 0),
              MusicScreen(tabIndex: 1),
              MusicScreen(tabIndex: 2),
              MusicScreen(tabIndex: 3)
            ]);
    _children.putIfAbsent(1,
        () => [InstructionScreen(tabIndex: 0), InstructionScreen(tabIndex: 1)]);
    _children.putIfAbsent(2, () => [StoryScreen()]);
    _children.putIfAbsent(3, () => [MyAccountScreen()]);
  }

  @override
  Widget build(BuildContext context) {
    // Temporarily used to set auth_token to default value.
    getIt<FlutterSecureStorage>().delete(key: 'auth_token');
    _populateChildrenMap();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    if (isLanding > 0) {
      _currentIndex = data['pageIndex'];
      _tabIndex = data['tabIndex'] ?? 0;
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
                _buildGoBackButton(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: _buildPageTitle()),
                Expanded(child: _buildSearchBar()),
                _getCurAppBarButton(_Tab.values[_currentIndex])
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: _children[_currentIndex][_tabIndex],
        bottomNavigationBar: _buildBottomNavBar());
  }

  IconButton _buildGoBackButton() {
    return IconButton(
        icon: Icon(Icons.arrow_back,
            size: 24, color: Theme.of(context).buttonColor),
        onPressed: () => Navigator.pushReplacementNamed(context, '/home'));
  }

  Text _buildPageTitle() {
    return Text(_getCurScreenTitle(_Tab.values[_currentIndex]),
        style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 22));
  }

  String _getCurScreenTitle(_Tab tab) {
    return tab == _Tab.TAB1
        ? '音乐'
        : tab == _Tab.TAB2 ? '指导' : tab == _Tab.TAB3 ? '故事' : '我的';
  }

  ClipRRect _buildSearchBar() {
    return ClipRRect(
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
                    style: TextStyle(fontSize: 14, color: Colors.white))
              ],
            )),
      ),
    );
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

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
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
            .toList());
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
