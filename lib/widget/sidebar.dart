import 'package:flutter/material.dart';
import 'package:web_music/util/style.dart';

import 'menu_side.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          SizedBox(height: 15.0,),
          Container(

          height: 80.0,
      width: 80.0,
      decoration:  BoxDecoration(
        //color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0x33A6A6A6)),
          image:  DecorationImage(image:  NetworkImage('web/img/ssd.png'),fit: BoxFit.fill),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),


      ),
          /*
          ID or name
           */
          Container(child: Text("hharddy",style: Text_Style.id_style,),
          margin: EdgeInsets.only(top: 15.0),),
          /*
          Email...
           */
          Container(child: Text("96atys@gmail.com",style: Text_Style.email_style,),
            margin: EdgeInsets.only(top: 10.0),)
,
          //menu
          SizedBox(height: 20.0,),
          MenuItemFirst()

        ],
      ),
    );
  }
}
