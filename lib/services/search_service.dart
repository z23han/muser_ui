import 'package:flutter/material.dart';
import 'package:muser_ui/managers/music_managers.dart';
import 'package:muser_ui/routes/music/music_player.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch() : super(searchFieldLabel: '搜索慕斯');

  static MusicManager _musicManager = new MusicManager();
  final matchResultsList = _musicManager.nameToId.keys;
  final searchSuggestionList = [
    'BBQ song',
    'Everybody has a Name',
    'Feelings',
    'Goodbye My Friend',
    'Hello And Welcome'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear, size: 24),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back,
            size: 24, color: Theme.of(context).buttonColor));
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchingDisplayList = query.isEmpty
        ? []
        : matchResultsList
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return _buildSearchDisplayList(searchingDisplayList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchingDisplayList = query.isEmpty
        ? searchSuggestionList
        : matchResultsList
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return _buildSearchDisplayList(searchingDisplayList);
  }

  Widget _buildSearchDisplayList(List displayList) {
    return ListView.separated(
        itemCount: displayList.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 30, 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(
                                music: _musicManager.musicMap[_musicManager
                                    .nameToId[displayList[index]]])));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                          child: Icon(Icons.music_note)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(_musicManager
                                      .musicMap[_musicManager
                                          .nameToId[displayList[index]]]
                                      .image),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  text: displayList[index]
                                      .substring(0, query.length),
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 16),
                                  children: [
                                TextSpan(
                                    text: displayList[index]
                                        .substring(query.length),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(fontSize: 16))
                              ])),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                _musicManager
                                    .musicMap[_musicManager
                                        .nameToId[displayList[index]]]
                                    .writer,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                          )
                        ],
                      )
                    ],
                  )),
            ));
  }
}
