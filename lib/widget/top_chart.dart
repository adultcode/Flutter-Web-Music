import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web_music/bloc/music_bloc.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/list_repository.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/billboard_item.dart';
import 'package:web_music/widget/now_playing.dart';

import 'now_playing.dart';

class TopChart extends StatefulWidget {
  @override
  _TopChartState createState() => _TopChartState();
}

class _TopChartState extends State<TopChart> {
  List<Music> musiclist = List();
  MusicListRepo rep = MusicListRepo();
  var next_pos = 120.0;
  ScrollController _scrollController = new ScrollController();

  var top = false;
  var bottom = true;
  @override
  void initState() {
    musiclist = rep.getmylist();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0){
          bottom=true;
        }

      else{
          // you are at top position
        top=true;
        }

    }
    });
  }

  @override
  Widget build(BuildContext context) {


    Widget BillBoardResponsive(){
      if(ScreenSize.width.toInt()<ScreenSize.mainpage_resize){
          return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Billboard TopChart",style: Text_Style.billboard_style_small,)
                ],
              ),
              Row(
                children: [

                  InkWell(child: Icon(Icons.arrow_back_ios,color: MyColor.grey_color,size: 17.0,),onTap: (){
                    _scrollController.jumpTo(_scrollController.position.pixels - next_pos);
                    if(bottom==false){

                      top=false;
                    }


                  },),
                  SizedBox(width: 8.0,),
                  InkWell(child: Icon(Icons.arrow_forward_ios,color: MyColor.grey_color,size: 17.0,),onTap: (){
                    _scrollController.jumpTo(_scrollController.position.pixels + next_pos);


                  },),
                  SizedBox(width: 18.0,),
                ],
              )
            ],
          );

      }else{

        return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Billboard TopChart",style: Text_Style.billboard_style,)
              ],
            ),
            Row(
              children: [

                InkWell(child: Icon(Icons.arrow_back_ios,color: MyColor.grey_color,size: 19.0,),onTap: (){
                  _scrollController.jumpTo(_scrollController.position.pixels - next_pos);
                  if(bottom==false){

                    top=false;
                  }


                },),
                SizedBox(width: 10.0,),
                InkWell(child: Icon(Icons.arrow_forward_ios,color: MyColor.grey_color,size: 19.0,),onTap: (){
                  _scrollController.jumpTo(_scrollController.position.pixels + next_pos);


                },),
                SizedBox(width: 20.0,),
              ],
            )
          ],
        );
      }

    }

    Widget MusicListResponsive(){
      if(ScreenSize.width.toInt()<570){
       return Container(
          padding: EdgeInsets.only(right: 15.0),

          height: 190.0,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
            itemCount: musiclist.length,
            itemBuilder: (context,index){
              return InkWell(child: BillBoardItem(musiclist[index]),
                onTap: (){
                  NowPlayState.ChangeMusic(musiclist[index]);
                },);
            },
          ),
        );
      }else{
      return  Container(
          padding: EdgeInsets.only(right: 15.0),

          height: 210.0,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
            itemCount: musiclist.length,
            itemBuilder: (context,index){
              return InkWell(child: BillBoardItem(musiclist[index]),
                onTap: (){
                  NowPlayState.ChangeMusic(musiclist[index]);
                },);
            },
          ),
        );
      }
    }


    return Container(
      margin: EdgeInsets.only(top: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //title and arrows
         BillBoardResponsive(),
          //listview
          SizedBox(height: 14.0,),

         MusicListResponsive()
        ],
      ),

    );
  }


}
