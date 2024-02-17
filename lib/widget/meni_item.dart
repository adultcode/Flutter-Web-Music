import 'package:flutter/material.dart';
import 'package:web_music/util/size.dart';

class MenuItem extends StatelessWidget {
  var title;
  var icon;
  var style;
  var color;


  MenuItem(this.title, this.icon, this.style,this.color);

  Widget TextOrNot(){
    if(ScreenSize.width.toInt()<759){

      return Container();
    }else{


      return Text(title,style: style,textAlign: TextAlign.justify,textDirection: TextDirection.ltr,);
    }
  }
  Widget MyRow(){
    if(ScreenSize.width.toInt()<759){

      return Container(
        margin: EdgeInsets.only(top: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: color,size: 25.0,),
            SizedBox(width: 6.0,),
            TextOrNot()
          ],
        ),
      );
    }else{


      return Container(
        margin: EdgeInsets.only(left: 25.0),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: color,),
            SizedBox(width: 6.0,),
            TextOrNot()
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  MyRow();
  }
}
