import 'package:flutter/material.dart';

class CommingSoon extends StatelessWidget {
  final String passage;
  const CommingSoon({this.passage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: _buildCommingSoonContent(passage)),
    );
  }

  _buildCommingSoonContent(String content) {}
}
