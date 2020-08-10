import 'package:flutter/material.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/style.dart';

import 'meni_item.dart';

class MenuItemFirst extends StatefulWidget {
  @override
  _MenuItemFirstState createState() => _MenuItemFirstState();
}

class _MenuItemFirstState extends State<MenuItemFirst> {

  List<bool> item_state = List();
  List<String> item_title = List();
  var pre_item_selected;

  @override
  void initState() {
    // TODO: implement initState
    item_state.add(false);
    item_state.add(false);
    item_state.add(false);
    item_state.add(false);
    item_state.add(false);
    item_state.add(false);
    item_state.add(false);

    //titles//
    item_title.add("Home");
    item_title.add("Browse");
    item_title.add("Album");
    item_title.add("Artist");
    item_title.add("Videos");
    item_title.add("Recently played");
    item_title.add("Local Files");
  }
 void  onTapMenu(int index){
    if(index != pre_item_selected){
      print("Clicked...... $pre_item_selected");

      setState(() {
        item_state[index] = true;
        if(pre_item_selected !=null) item_state[pre_item_selected]=false;
      });
      pre_item_selected = index;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                  item_title[0],
                  Icons.home,
                  item_state[0]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                  item_state[0]==false?MyColor.id_color:MyColor.blue_color
              ),
              onTap:  (){
                onTapMenu(0);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                  item_title[1],
                  Icons.apps,
                  item_state[1]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                  item_state[1]==false?MyColor.id_color:MyColor.blue_color
              ),
              onTap:  (){
                onTapMenu(1);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                  item_title[2],
                  Icons.album,
                  item_state[2]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                  item_state[2]==false?MyColor.id_color:MyColor.blue_color,
              ),
              onTap: (){
                onTapMenu(2);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                item_title[3],
                Icons.supervisor_account,
                item_state[3]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                item_state[3]==false?MyColor.id_color:MyColor.blue_color,
              ),
              onTap: (){
                onTapMenu(3);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                item_title[4],
                Icons.video_library,
                item_state[4]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                item_state[4]==false?MyColor.id_color:MyColor.blue_color,
              ),
              onTap: (){
                onTapMenu(4);
              },
            ),
          ),
          // my music
          Container(
            width: 100.0,
            margin: EdgeInsets.only(top: 20.0,left: 25.0),
            child: Text(
              "My Music",
              style: Text_Style.menu_my_music_style,
              textAlign: TextAlign.left,
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: InkWell(
              child: MenuItem(

                item_title[5],
                Icons.play_circle_outline,
                item_state[5]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                item_state[5]==false?MyColor.id_color:MyColor.blue_color,
              ),
              onTap: (){
                onTapMenu(5);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              child: MenuItem(

                item_title[6],
                Icons.insert_drive_file,
                item_state[6]==false?Text_Style.id_menuitem:Text_Style.id_menuitem_active,
                item_state[6]==false?MyColor.id_color:MyColor.blue_color,
              ),
              onTap: (){
                onTapMenu(6);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(45.0),
            margin: EdgeInsets.only(top: 30.0),
            child: Image.network('web/img/button.PNG',fit: BoxFit.fill,)
          ),
        ],
      ),
    );
  }
}
