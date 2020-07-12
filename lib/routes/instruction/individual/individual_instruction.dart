import 'package:flutter/material.dart';
import 'package:muser_ui/services/comming_soon.dart';
import 'package:muser_ui/services/music_service.dart';

class IndividualInstruction extends StatelessWidget {

  final MusicService musicService = new MusicService();

  turnOffMusic() async {
    if (this.musicService.music != null ) {
      await this.musicService.reInitAudio();
    }
  }

  @override
  Widget build(BuildContext context) {

    turnOffMusic();

    return Container();
  }
}
