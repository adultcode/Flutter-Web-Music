//import 'package:flutter/material.dart';
//import 'package:web_music/model/music_model.dart';
//
//class MusicWidge{
//
//  Widget getMusicWidgetBloc(Music music){
//
//    return
//      Column(
//        children: [
//          Container(
//              margin: EdgeInsets.only(top: 10.0),
//              padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 35.0),
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.all(
//                    Radius.circular(
//                        15.0) //                 <--- border radius here
//                ),
//              ),
//              child: Column(
//                children: [
//                  Container(
//
//                    height: 70.0,
//                    width: 70.0,
//                    decoration: BoxDecoration(
//                      //color: Colors.white,
//                        shape: BoxShape.circle,
//                        border: Border.all(color: const Color(0x33A6A6A6)),
//                        image: DecorationImage(
//                            image: NetworkImage('web/img/ssd.png'),
//                            fit: BoxFit.fill),
//
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.grey.withOpacity(0.5),
//                            spreadRadius: 2,
//                            blurRadius: 4,
//                            offset: Offset(0, 2), // changes position of shadow
//                          ),
//                        ]
//                    ),
//
//
//                  ),
//                  SizedBox(height: 10.0,),
//                  Text(music.name, style: Text_Style.songname_style,),
//                  SizedBox(height: 6.0,),
//                  Text(music.artist, style: Text_Style.asrtist_style,),
//                  SizedBox(height: 6.0,),
//                  Container(
//                    width: 250.0,
//                    height: 4.0,
//                    margin: EdgeInsets.only(top: 6.0),
//                    child: SliderTheme(
//                        data: SliderTheme.of(context).copyWith(
//                          activeTrackColor: Colors.blue,
//                          thumbShape: RoundSliderThumbShape(
//                              enabledThumbRadius: 5.0),
//                          overlayShape: RoundSliderOverlayShape(
//                              overlayRadius: 7.0),
//                        ),
//
//                        child:   StreamBuilder<Duration>(
//                            stream: player.durationStream,
//                            builder: (context, snapshot){
//                              final duration = snapshot.data ?? Duration.zero;
//                              return StreamBuilder<Duration>(
//                                  stream: player.getPositionStream(),
//                                  builder: (context, snapshot){
//                                    var position = snapshot.data ?? Duration.zero;
//                                    if (position > duration) {
//                                      position = duration;
//                                    }
//                                    if(isinit){
//                                      return
//                                        Slider(
//                                            max:  maxSlider
//                                            ,value: position.inMilliseconds.toDouble(),
//                                            onChanged: (values) {
//                                              setState(() {
//                                                print(values);
//                                                player.seek(Duration(milliseconds: values.toInt()));
//                                              });
//                                            }
//                                        );
//                                    }else{
//                                      return    Slider(value: value, onChanged: (values) {
//                                        setState(() {
//                                          value = values;
//                                        });
//                                      }
//                                      );
//                                    }
//                                  }
//                              );
//                            }
//                        )
//                    ),
//                  ),
//                  Container(
//                    width: 250.0,
//                    margin: EdgeInsets.only(top: 8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Row(
//                          children: [
//                            StreamBuilder<Duration>(
//                                stream: player.durationStream,
//                                builder: (context, snapshot){
//                                  final duration = snapshot.data ?? Duration.zero;
//                                  return StreamBuilder<Duration>(
//                                      stream: player.getPositionStream(),
//                                      builder: (context, snapshot){
//                                        var position = snapshot.data ?? Duration.zero;
//                                        if (position > duration) {
//                                          //   position = duration;
//                                        }
//                                        if(isinit){
//                                          return Text(checkForNewSharedLists(position), style: Text_Style.search_hint_style,);
//                                        }else{
//                                          return    Text("00:00", style: Text_Style.search_hint_style,);
//                                        }
//                                      }
//                                  );
//                                }
//                            )
//                            //(child: Text("$currentduration", style: Text_Style.search_hint_style,))
//                          ],
//                        ),
//                        Row(
//                          children: [
//                            Text("${duration.toString()}",
//                              style: Text_Style.search_hint_style,)
//                          ],
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              )
//          ),
//          SizedBox(height: 17.0,),
//          Row(
//
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Icon(Icons.skip_previous, size: 24.0, color: MyColor.grey_color),
//              SizedBox(width: 18.0,),
//              InkWell(
//                onTap: () {
//                  //  initPlayer(url);
//                  //   player.play();
//                  if (isinit) {
//                    play();
//                  } else {
//                    initPlayer(music.url);
//                  }
//                },
//                child: Container(
//                  padding: EdgeInsets.all(6.0),
//                  child: Icon(isplay == true ? Icons.pause : Icons.play_arrow,
//                    color: MyColor.blue_color,),
//                  decoration: BoxDecoration(
//                      color: Colors.white,
//                      shape: BoxShape.circle,
//                      border: Border.all(color: const Color(0x33A6A6A6)),
//
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.grey.withOpacity(0.3),
//                          spreadRadius: 2,
//                          blurRadius: 2,
//                          offset: Offset(0, 1), // changes position of shadow
//                        ),
//                      ]
//                  ),
//                ),
//              ),
//              SizedBox(width: 18.0,),
//              Icon(Icons.skip_next, size: 24.0, color: MyColor.grey_color),
//
//            ],
//          ),
//          SizedBox(height: 10.0,)
//        ],
//
//      );
//  }
//}