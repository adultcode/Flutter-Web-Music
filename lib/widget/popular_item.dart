import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/style.dart';

class PopularItem extends StatelessWidget {
  Music music;

  PopularItem(this.music);

  @override
  Widget build(BuildContext context) {
    var percent = MediaQuery.of(context).size.width/100;
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 5.0),
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.all(
              Radius.circular(6.0)
          ),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
        children: [

          Container(
              width: 40.0,
              height: 40.0
              ,margin: EdgeInsets.only(left:21.0 )
              ,decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            image:  DecorationImage(image:  NetworkImage(music.img),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            ),
          )
          ),

          Container(child: Icon(Icons.play_arrow,size: 20.0,color: MyColor.grey_color,),
          margin: EdgeInsets.only(left: percent*5.4),),
        //  SizedBox(width: 16.0,),
         Container(child: Text(music.name,style: Text_Style.songname_style,textAlign: TextAlign.left,),
             margin: EdgeInsets.only(left: percent*8)),
       //   SizedBox(width: percent*5,),
          Container(child: Text(music.artist,style: Text_Style.asrtist_style,textAlign: TextAlign.left,),
              margin: EdgeInsets.only(left: percent*22.7)),
     //     SizedBox(width: percent*5,),
     //     Text("4:30",style: Text_Style.asrtist_style,textAlign: TextAlign.left,)   ,
      //    SizedBox(width: percent*6,),
         Container(child: Icon(Icons.favorite,size: 20.0,color: MyColor.grey_color,),
             margin: EdgeInsets.only(left: percent*32.8)),
      ],
    ),
    );
  }
}
