import 'package:flutter/material.dart';
import 'package:muser_ui/managers/search_manager.dart';
import 'package:muser_ui/managers/music_managers.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch() : super(searchFieldLabel: '搜索慕斯');
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
    return ListView.builder(
        itemCount: searchingDisplayList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 30, 20),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                      child: Text('$index',
                          style: Theme.of(context).textTheme.headline5.copyWith(
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
                                .headline5
                                .copyWith(fontSize: 16))
                      ])),
                ],
              ),
            ));
  }
}