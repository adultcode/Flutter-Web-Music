import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/most_popular.dart';
import 'package:web_music/widget/playin_section.dart';

class SecondMain extends StatelessWidget {
  var wid;

  SecondMain(this.wid);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [

              Container(
                width: (wid/2)-20.0,

               // child: MostPopular(),
                child: Text("Most Popular",style: Text_Style.billboard_style,),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: wid/2,
               //margin: EdgeInsets.only(right: 20.0),
               // color: Colors.red,
               // child: Playing(),
                child: Text("Now Playing",style: Text_Style.billboard_style,),
              )
            ],
          )
        ],
      ),
    );
  }
}
