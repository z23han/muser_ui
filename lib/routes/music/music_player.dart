import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muser_ui/services/music_object.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Music music;

  const MusicPlayerScreen({this.music});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 100,
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
                onChanged: (v) {},
                value: 10,
                max: 100,
                min: 0,
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