import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  var title;
  var icon;
  var style;
  var color;


  MenuItem(this.title, this.icon, this.style,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(icon,color: color,),
          SizedBox(width: 6.0,),
          Text(title,style: style,textAlign: TextAlign.justify,textDirection: TextDirection.ltr,)
        ],
      ),
    );
  }
}
