import 'package:flutter/material.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/search.dart';

class Header extends StatelessWidget {

  Widget HeaaderIcons(){
    if(ScreenSize.width.toInt()<570){
      return Row(
        children: [

          Icon(Icons.notifications_active,color: MyColor.grey_color,size: 17.0,),
          SizedBox(width: 14.0,),
          Icon(Icons.settings, color:MyColor.grey_color,size: 17.0),
          SizedBox(width: 11.0,),
          Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              child: Text("Upgrade Plan",style: Text_Style.upgrade_text_style_small,),
              decoration: BoxDecoration(
                color: MyColor.red_color,

                borderRadius: BorderRadius.all(
                    Radius.circular(38.0)
                ),
              )
          ),
          SizedBox(width: 16.0,)
        ],
      );
    }else{
      return Row(
        children: [

          Icon(Icons.notifications_active,color: MyColor.grey_color,),
          SizedBox(width: 15.0,),
          Icon(Icons.settings, color:MyColor.grey_color),
          SizedBox(width: 15.0,),
          Container(
              padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              child: Text("Upgrade Plan",style: Text_Style.upgrade_text_style,),
              decoration: BoxDecoration(
                color: MyColor.red_color,

                borderRadius: BorderRadius.all(
                    Radius.circular(38.0)
                ),
              )
          ),
          SizedBox(width: 20.0,)
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Search()
            ],
          ),
          HeaaderIcons()

        ],
      ),
    );
  }
}
