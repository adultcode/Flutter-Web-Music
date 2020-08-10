import 'dart:async';

//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_music/bloc/music_bloc.dart';
import 'package:web_music/bloc/music_state.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/style.dart';
import 'dart:js' as js;
import 'package:just_audio/just_audio.dart';

class NowPlaying extends StatefulWidget {
  @override
  NowPlayState createState() => NowPlayState();
}

class NowPlayState extends State<NowPlaying> {
  static Music mymusic = Music(
      "Summer feelings",
      "Lennon Stella",
      "http://dlera6.xyz/uploads/posts/2020-05/thumbs/1590824359_600x600bb.jpg",
      "http://dl2.bikalammusic.com/new-links/99/02/Oliva%20-%202020%20-%2001.%20The%20First%20to%20Arrive%20-%20bikalammusic.com.mp3");

  static var _bloc = MusicBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is InitMusic) {
            print("ssssssssssssssssssssssssssssssssssssss");
            // return  getMusicWidgetBloc(mymusic);
            return getMusicWidgetBloc(state.music);
          } else if (state is FirstMusic) {
            return getMusicWidgetBloc(state.music);
          } else {
            return Container();
          }
        });
  }

  static ChangeMusic(Music music) {
    _bloc.onFirsttMusicEvent(music);
  }

  Widget getMusicWidgetBloc(Music music) {
    return Container(
      padding: EdgeInsets.all(7.0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 5.0, right: 10.0),
      decoration: BoxDecoration(
        color: MyColor.play_gray,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 35.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                        15.0) //                 <--- border radius here
                    ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0x33A6A6A6)),
                        image: DecorationImage(
                            image: NetworkImage(_bloc.mymusic.img),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    music.name,
                    style: Text_Style.songname_style,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    music.artist,
                    style: Text_Style.asrtist_style,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    width: 250.0,
                    height: 4.0,
                    margin: EdgeInsets.only(top: 6.0),
                    child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.blue,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 5.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 7.0),
                        ),
                        child: StreamBuilder<Duration>(
                            stream: _bloc.player.durationStream,
                            builder: (context, snapshot) {
                              final duration = snapshot.data ?? Duration.zero;
                              return StreamBuilder<Duration>(
                                  stream: _bloc.player.getPositionStream(),
                                  builder: (context, snapshot) {
                                    var position =
                                        snapshot.data ?? Duration.zero;
                                    if (position > duration) {
                                      position = duration;
                                    }
                                    if (_bloc.isinit) {
                                      return Slider(
                                          max: _bloc.maxSlider,
                                          value: position.inMilliseconds
                                              .toDouble(),
                                          onChanged: (values) {
                                            setState(() {
                                              print(values);
                                              _bloc.player.seek(Duration(
                                                  milliseconds:
                                                      values.toInt()));
                                            });
                                          });
                                    } else {
                                      return Slider(
                                          value: _bloc.value,
                                          onChanged: (values) {
                                            setState(() {
                                              _bloc.value = values;
                                            });
                                          });
                                    }
                                  });
                            })),
                  ),
                  Container(
                    width: 250.0,
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            StreamBuilder<Duration>(
                                stream: _bloc.player.durationStream,
                                builder: (context, snapshot) {
                                  final duration =
                                      snapshot.data ?? Duration.zero;
                                  return StreamBuilder<Duration>(
                                      stream: _bloc.player.getPositionStream(),
                                      builder: (context, snapshot) {
                                        var position =
                                            snapshot.data ?? Duration.zero;
                                        if (position > duration) {
                                          //   position = duration;
                                        }
                                        if (_bloc.isinit) {
                                          return Text(
                                            checkForNewSharedLists(position),
                                            style: Text_Style.search_hint_style,
                                          );
                                          // return    Text("00:00", style: Text_Style.search_hint_style,);
                                        } else {
                                          return Text(
                                            "00:00",
                                            style: Text_Style.search_hint_style,
                                          );
                                        }
                                      });
                                })
                            //(child: Text("$currentduration", style: Text_Style.search_hint_style,))
                          ],
                        ),
                        Row(
                          children: [
                            //  Text("${duration.toString()}",
                            StreamBuilder<String>(
                                stream: _bloc.duration_subject,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data,
                                      style: Text_Style.search_hint_style,
                                    );
                                  } else
                                    return Container();
                                })
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 17.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.skip_previous, size: 24.0, color: MyColor.grey_color),
              SizedBox(
                width: 18.0,
              ),
              InkWell(
                onTap: () {
                  if (_bloc.isinit) {
                    _bloc.play();
                  } else {
                    _bloc.play();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  child: StreamBuilder<bool>(
                      stream: _bloc.isplay_subject,
                      builder: (context, snapshot) {
                        return Icon(
                          _bloc.isplay_subject.value == true
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: MyColor.blue_color,
                        );
                      }),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0x33A6A6A6)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Icon(Icons.skip_next, size: 24.0, color: MyColor.grey_color),
            ],
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  checkForNewSharedLists(Duration time) {
    if (time.inSeconds < 60) {
      return _bloc.currentduration_subject =
          time.inMinutes.toString() + ":" + time.inSeconds.toString();
    } else {
      return _bloc.currentduration_subject =
          time.inMinutes.toString() + ":" + (time.inSeconds % 60).toString();
    }
  }

  @override
  void initState() {
    //testplay(_bloc.mymusic);
    _bloc.onInitMusicEvent();
  }
}
