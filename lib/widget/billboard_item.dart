import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/style.dart';
class BillBoardItem extends StatelessWidget {
  Music music;

  BillBoardItem(this.music);

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130.0,
             height: 145.0
              ,decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
            image:  DecorationImage(image:  NetworkImage(music.img),fit: BoxFit.fill),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)
        ),
          )
          ),
          SizedBox(height: 9.0,),
          Text(music.name,style: Text_Style.songname_style,textAlign: TextAlign.left,),
          SizedBox(height: 5.0,),
          Text(music.artist,style: Text_Style.asrtist_style,textAlign: TextAlign.left,)
        ],
      ),
    );
  }
}
