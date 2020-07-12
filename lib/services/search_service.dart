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
      FlatButton(
          onPressed: () {
            close(context, null);
          },
          child: Text('取消',
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 20)))
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
    return ListView.separated(
        itemCount: searchingDisplayList.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 30, 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(
                                music: _musicManager.musicMap[_musicManager
                                    .nameToId[searchingDisplayList[index]]])));
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
                                      .musicMap[_musicManager.nameToId[
                                          searchingDisplayList[index]]]
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
                                        .headline5
                                        .copyWith(fontSize: 16))
                              ])),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                _musicManager
                                    .musicMap[_musicManager
                                        .nameToId[searchingDisplayList[index]]]
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
