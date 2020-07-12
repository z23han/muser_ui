import 'package:audioplayers/audioplayers.dart';
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

    if (this.musicService.music == null) {
      initPlayer();
    } else if (this.musicService.music.musicId == widget.music.musicId) {
      print("${widget.music.url} is playing, do nothing");
      // we still need to keep track of the music state
      _updateMusicPlayerScreen();

      return;
    } else {
      reInitPlayer();
    }
  }

  initPlayer() async {
    await this.musicService.initMusicService();

    await play();

    await _updateMusicPlayerScreen();
  }

  reInitPlayer() async {
    await this.musicService.reInitAudio();

    await play();

    await _updateMusicPlayerScreen();
  }

  play() async {
    await this.musicService.play(widget.music.musicId);
  }

  pause() async {
    await this.musicService.pause();
  }

  resume() async {
    await this.musicService.resume();
  }

  stop() async {
    await this.musicService.stop();
  }

  seek(double newValue) async {
    await this.musicService.seek(newValue);
  }

  _updateMusicPlayerScreen() async {
    if (this.musicService.audioPlayer != null) {
            
      int duration;

      while (duration == null) {
        
        duration = await Future.delayed(
          Duration(seconds: 1), () => this.musicService.audioPlayer.getDuration()

        );
      }

      this._maxPosition = duration.toDouble();

      _updateSlider();

      _updateState();

      _checkClickButton();
    } else {
      reInitPlayer();
    }
  }

  void _updateSlider() {
    this.musicService.audioPlayer.onAudioPositionChanged.listen((Duration p) {
      if (mounted) {
        setState(() {
          _currPosition = p.inMilliseconds.toDouble();

          this.musicService.currDuration = _currPosition.toInt();
        });
      }
    }, onError: (msg) {
      print(msg);

      print('re-init music ${this.musicService.music.url}');

      reInitPlayer();
    });
  }

  void _updateState() {
    this.musicService.audioPlayer.onPlayerStateChanged.listen(
        (AudioPlayerState s) {
      if (s == AudioPlayerState.PLAYING) {
      } else if (s == AudioPlayerState.COMPLETED) {
        print("${this.musicService.music.url} is completed");

        if (mounted) {
          setState(() {
            _currPosition = 0;
            _isPlaying = false;
          });
        }
      } else if (s == AudioPlayerState.PAUSED) {
        print("${this.musicService.music.url} is paused");
        this.musicService.currDuration = _currPosition.toInt();
      }
    }, onError: (msg) {
      print(msg);

      print('re-init music ${this.musicService.music.url}');

      reInitPlayer();
    });
  }

  void _checkClickButton() {
    if (mounted) {
      setState(() {
        if (this.musicService.isPlaying) {
          this._isPlaying = true;
        } else {
          this._isPlaying = false;
        }
      });
    }
  }

  IconButton _buildGoBackButton() {
    return IconButton(
        icon: Icon(Icons.arrow_back,
            size: 24, color: Theme.of(context).buttonColor),
        onPressed: () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
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
                ],
              ),
            ),
          ),
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
                            blurRadius: 40)
                      ]),
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage(widget.music.image),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.music.name,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  widget.music.writer,
                  style: TextStyle(fontSize: 15),
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
                SizedBox(
                  height: 30,
                ),
                Row(
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
                            resume();
                          } else {
                            pause();
                          }
                        });
                      },
                      icon: Icon(_isPlaying
                          ? FontAwesomeIcons.pause
                          : FontAwesomeIcons.play),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.forward),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
