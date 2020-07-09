import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muser_ui/models/music_object.dart';
import 'dart:io';

class MusicPlayerScreen extends StatefulWidget {
  final Music music;

  const MusicPlayerScreen({this.music});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  bool _isPlaying = true;
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  double _currPosition = 0;
  double _maxPosition = 60000;
  final double _minPosition = 0;

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      audioPlayer.startHeadlessService();
    }

    // init state is play
    initPlayer();
    play();
    _updateSlider();
  }

  initPlayer() async {
    int result = await audioPlayer.setUrl(widget.music.url);
    if (result == 1) {
      print('${widget.music.name} is ready');
    }

    int totalMilliSec = 0;
    while (totalMilliSec == 0 || totalMilliSec == null) {
      totalMilliSec = await Future.delayed(Duration(seconds: 2), () => 
        audioPlayer.getDuration()
      );
    }
    print('${widget.music.name} total length in millisec: $totalMilliSec');
    setState(() {
      _maxPosition = totalMilliSec.toDouble();
    });
  }

  play() async {
    int result = await audioPlayer.play(widget.music.url);
    if (result == 1) {
      print("${widget.music.name} is playing");
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("${widget.music.name} is paused");
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print("${widget.music.name} is stopped");
    }
  }

  seek(double newValue) async {
    int result = await audioPlayer.seek(Duration(milliseconds: newValue.toInt()));
    if (result == 1) {
      print('${widget.music.name} is set to $newValue in milliseconds');
    }
  }

  void _updateSlider() {
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _currPosition = p.inMilliseconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                      blurRadius: 40
                    )
                  ]
                ),
                child: ClipRRect(
                  child: Image(
                    image: AssetImage(widget.music.image),
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.width*0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Text(
                widget.music.name,
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Text(
                widget.music.writer,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              Slider(
                value: _currPosition,
                max: _maxPosition,
                min: _minPosition,
                onChanged: (newValue) {
                  setState(() {
                    _currPosition = newValue;
                    seek(newValue);
                  });
                },
                activeColor: Colors.grey[800],
              ),
              SizedBox(height: 30,),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.backward),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                        if (_isPlaying) {
                          play();
                        } else {
                          pause();
                        }
                      });
                    },
                    icon: Icon(
                      _isPlaying ? FontAwesomeIcons.play : FontAwesomeIcons.pause
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.forward),
                  )
                ],
              )

            ],
          ),
        )
      ),
    );
  }
}