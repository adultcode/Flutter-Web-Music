import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/widget/main_section.dart';
import 'package:web_music/widget/sidebar.dart';

class HomePage extends StatelessWidget {

  static BehaviorSubject<int> sizeSubject = BehaviorSubject<int>();
  @override
  Widget build(BuildContext context) {

    ScreenSize.width = MediaQuery.of(context).size.width;
    ScreenSize.height  = MediaQuery.of(context).size.height;


    if(sizeSubject.value != ScreenSize.width.toInt()){
      sizeSubject.sink.add(ScreenSize.width.toInt());
    }

print("width: ${ScreenSize.width}");
print("percentwidth: ${ScreenSize.getWidthPercent()}");
    return Container(
      child: Row(
        children: [

          Container(

            height: ScreenSize.height,
            width: ScreenSize.width*0.2,
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
            height: ScreenSize.height,
            width: ScreenSize.width*0.8,
            child: MainSection(ScreenSize.width*0.8),
          ),
        ],
      ),
    );

  }
}
