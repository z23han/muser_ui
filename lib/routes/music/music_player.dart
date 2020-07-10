import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muser_ui/models/music_object.dart';

import 'package:muser_ui/services/music_service.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Music music;

  const MusicPlayerScreen({this.music});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  bool _isPlaying = true;
  MusicService musicService;
  double _currPosition = 0;
  double _maxPosition = 60000;
  final double _minPosition = 0;

  @override
  void initState() {
    super.initState();

    this.musicService = new MusicService();
    this.musicService.setMusic(widget.music);
    
    initPlayer();
  }


  initPlayer() async {

    await this.musicService.initMusicService();
    await this.musicService.downloadFile();
    
    this._maxPosition = this.musicService.duration.toDouble();

    await play();

    _updateSlider();
  }

  play() async {
    await this.musicService.play();
  }

  pause() async {
    await this.musicService.pause();
  }

  stop() async {
    await this.musicService.stop();
  }

  seek(double newValue) async {
    await this.musicService.seek(newValue);
  }

  void _updateSlider() {
    this.musicService.audioPlayer.onAudioPositionChanged.listen((Duration p) {
      if (mounted) {
        setState(() {
          _currPosition = p.inMilliseconds.toDouble();
        });
      }
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
                      _isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play
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