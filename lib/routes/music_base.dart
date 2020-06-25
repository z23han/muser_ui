import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './music.dart';
import './instruction.dart';
import './story.dart';
import './device.dart';

// access to global variables
GetIt getIt = GetIt.instance;

class MusicBase extends StatefulWidget {
  @override
  _MusicBaseState createState() => _MusicBaseState();
}

class _MusicBaseState extends State<MusicBase> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MusicScreen(),
    InstructionScreen(),
    StoryScreen(),
    DeviceScreen()
  ];

  void onTabTapped(int index) {
    // trigger build method to rebuild
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Temporarily used to set auth_token to default value.
    getIt<FlutterSecureStorage>().delete(key: 'auth_token');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note, color: Colors.grey[400]),
                  title: Text('音乐', style: TextStyle(color: Colors.grey[400]))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books, color: Colors.grey[400]),
                  title:
                      Text('疗愈指导', style: TextStyle(color: Colors.grey[400]))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people, color: Colors.grey[400]),
                  title: Text('故事', style: TextStyle(color: Colors.grey[400]))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.watch, color: Colors.grey[400]),
                  title:
                      Text('穿戴设备', style: TextStyle(color: Colors.grey[400])))
            ]));
  }
}
