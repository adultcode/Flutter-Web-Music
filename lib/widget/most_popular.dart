import 'package:flutter/material.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/list_repository.dart';
import 'package:web_music/util/style.dart';
import 'package:web_music/widget/popular_item.dart';

import 'now_playing.dart';

class MostPopular extends StatefulWidget {
  @override
  _MostPopularState createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {

  List<Music> musiclist = List();
  MusicListRepo rep = MusicListRepo();

  @override
  void initState() {
    musiclist = rep.getmylist();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text("Most Popular",style: Text_Style.billboard_style,),
          SizedBox(height: 1.0,)
          ,Container(
            padding: const EdgeInsets.only(right:5.0),
            child: ListView.builder(
              shrinkWrap: true,

                  itemCount:  4,
              itemBuilder: (context,index){
                    return InkWell(
                        //child: PopularItem(musiclist[index])
                      child:Container(child:Text('sdsdsd'))
                    ,onTap: (){
                   //   /NowPlayState.ChangeMusic(musiclist[index]);
                      print("hey: ${musiclist[index].img}");
                    },
                    );
              },
            )
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
