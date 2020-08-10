import 'package:flutter/material.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/widget/main_section.dart';
import 'package:web_music/widget/sidebar.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Container(
      child: Row(
        children: [

          Container(

            height: height,
            width: width*0.2,
            child: SideBar(),
            decoration: BoxDecoration(
                color: Colors.white,
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: MyColor.grey_color
                )
              )
            ),
          ),
          Container(
            color: MyColor.right_color,
            height: height,
            width: width*0.8,
            child: MainSection(width*0.8),
          ),
        ],
      ),
    );

  }
}
