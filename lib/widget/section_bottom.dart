import 'package:flutter/material.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/list_repository.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/playin_section.dart';
import 'package:web_music/widget/popular_item.dart';

import 'now_playing.dart';

class SectionBottom extends StatelessWidget {

  var wid;

  SectionBottom(this.wid);
  @override
  Widget build(BuildContext context) {


    MusicListRepo rep = MusicListRepo();

    Widget SectionBottomREsponsive(){
      if(ScreenSize.width <ScreenSize.mainpage_resize){
        return Container(
          child:  Container(
            width: wid,
            //  margin: EdgeInsets.only(right: 20.0),
            child: Playing(),
          )


        );
      }else{
        return Container(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: (wid/2)-26.0,
                    child: Container(
                        margin: EdgeInsets.only(right: 6.0,bottom: 17.0),
                        padding: const EdgeInsets.only(right:5.0),
                        child: ListView.builder(
                          shrinkWrap: true,

                          itemCount:  4,
                          itemBuilder: (context,index){
                            return PopularItem(rep.getmylist()[index]);
                          },
                        )
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: wid/2,
                    //  margin: EdgeInsets.only(right: 20.0),
                    child: Playing(),
                  )
                ],
              )
            ],
          ),
        );
      }
    }
    return SectionBottomREsponsive();
  }
}
