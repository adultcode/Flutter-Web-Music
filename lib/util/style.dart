import 'package:flutter/material.dart';

import 'MyColor.dart';

class Text_Style{

  static const id_style = TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: MyColor.id_color);
  static const email_style = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w200,color: MyColor.grey_color);

  // menu item not active
  static const id_menuitem = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w500,color: MyColor.id_color);
  // menu item  active
  static const id_menuitem_active = TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color: MyColor.blue_color);
  static const menu_my_music_style = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: MyColor.grey_color);

  //search
  static const search_hint_style = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: MyColor.grey_color);
  static const search_text_style = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: MyColor.id_color);

  //upgrade
  static const upgrade_text_style = TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: Colors.white);

  //chart
  static const billboard_style = TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: MyColor.id_color);
  static const songname_style = TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600,color: MyColor.id_color);
  static const asrtist_style = TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: MyColor.grey_color);
}