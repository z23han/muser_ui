import 'package:flutter/material.dart';
import './music.dart';
import './instruction.dart';
import './story.dart';
import './device.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [MusicScreen(), InstructionScreen(), StoryScreen(), DeviceScreen()];

  void onTabTapped(int index) {
    // trigger build method to rebuild
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _children[_currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, color: Colors.grey[400]), 
            title: Text('音乐',  style: TextStyle(color: Colors.grey[400]))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.grey[400]),
            title: Text('引导', style: TextStyle(color: Colors.grey[400]))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.grey[400]),
            title: Text('故事', style: TextStyle(color: Colors.grey[400]))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch, color: Colors.grey[400]),
            title: Text('设备', style: TextStyle(color: Colors.grey[400]))
          )
        ]
      )
    );

  }
}
