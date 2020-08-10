import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/style.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
    height: 40.0,
    //  padding: EdgeInsets.symmetric(vertical:-5.0),
      decoration:  BoxDecoration(
        color: MyColor.right_color,
        border: Border.all(
        width: 1.0
            ,color: MyColor.grey_border
    ),
    borderRadius: BorderRadius.all(
    Radius.circular(38.0) //                 <--- border radius here
    ),
    ),

        child: TextFormField(

          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top:10),
            prefixIcon: Icon(Icons.search,size: 17.0,),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,

            hintText: "Search for song...",
                hintStyle: Text_Style.search_hint_style
          ),
          style: Text_Style.search_text_style,
    ),
    );
  }
}
