import 'package:flutter/material.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/now_playing.dart';

import 'now_playing.dart';

class Playing extends StatefulWidget {
  @override
  _PlayingState createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 19.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          //NowPlaying()
          NowPlaying()
        ],
      ),
    );
  }
}
