import 'package:flutter/material.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/util/style.dart';

import 'menu_side.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {


  Widget ShowAvavtar(){
    if(ScreenSize.width.toInt()<700){

      return Avatar(50.0);
    }else{


      return Avatar(80.0);
    }
  }

  Widget ResizeText(){

    if(ScreenSize.width.toInt()<700){

      return Column(

        children: [
          SizedBox(height: 15.0,),
          ShowAvavtar(),
          /*
          ID or name
           */
          Container(child: Text("hharddy",style: Text_Style.id_style_small,),
            margin: EdgeInsets.only(top: 15.0),),
          /*
          Email...
           */
          Container(child: Text("96atys@gmail.com",style: Text_Style.email_style_small,),
            margin: EdgeInsets.only(top: 10.0),)
          ,
          //menu
          SizedBox(height: 20.0,),
          MenuItemFirst()

        ],
      );
    }else{


      return Column(

        children: [
          SizedBox(height: 15.0,),
          ShowAvavtar(),
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
      );
    }
  }

  Widget Avatar(var size){
    return Container(

      height: size,
      width: size,
      decoration:  BoxDecoration(
        //color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0x33A6A6A6)),
          image:  DecorationImage(image:  NetworkImage('web/img/ssd.png'),fit: BoxFit.fill),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]
      ),


    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResizeText(),
    );
  }
}
