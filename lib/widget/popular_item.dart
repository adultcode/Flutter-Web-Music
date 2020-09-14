import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_music/model/music_model.dart';
import 'package:web_music/screen/homepage.dart';
import 'package:web_music/util/MyColor.dart';
import 'package:web_music/util/size.dart';
import 'package:web_music/util/style.dart';

class PopularItem extends StatefulWidget {
  Music music;

  PopularItem(this.music);

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  var isl = 0;
  bool liked;

  int temp = 0;
  var size_like = 20.0;
  var song_style = Text_Style.songname_style;
  var artist_style = Text_Style.asrtist_style;

  var artist_name_widget;
  @override
  Widget build(BuildContext context) {
    Widget PopularItemResponsive() {
      if (ScreenSize.width.toInt() < 850) {
      } else {}
    }

    HomePage.sizeSubject.listen((value) {
      // print("temp: $value");
      if (temp != value) {
        print("temp: $temp");
        temp = value;

        if (value < 835) {
          setState(() {
            song_style = Text_Style.songname_style_small;
            artist_style = Text_Style.asrtist_style_small;
            size_like = 18.0;
          });
        }
        else {
          setState(() {
            size_like = 20.0;
            song_style = Text_Style.songname_style;
            artist_style = Text_Style.asrtist_style;
          });
        }

        if(value < 790){
          setState(() {
            artist_name_widget  = SizedBox(width: 4.0,);
          });
        }else{
          artist_name_widget =Expanded(
            flex: 1,
            child: Container(
                child: Text(
                  widget.music.artist,
                  style: Text_Style.asrtist_style,
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(right: 5.0)),
          );
        }
      }
    });

    return StreamBuilder<int>(
      stream: HomePage.sizeSubject,
      builder: (context, snapshot) {
        return Container(
          height: 60.0,
          margin: EdgeInsets.only(top: 5.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(left: 21.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(widget.music.img),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  child: Icon(
                    Icons.play_arrow,
                    size: 20.0,
                    color: MyColor.grey_color,
                  ),
                  //margin: EdgeInsets.only(left: percent * 5.4),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    widget.music.name,
                    style: song_style,
                    textAlign: TextAlign.left,
                  ),
                  // margin: EdgeInsets.only(left: percent * 8)
                ),
              ),
              //
              artist_name_widget,
              Container(
                child: InkWell(
                  child: Icon(
                    Icons.favorite,
                    size: size_like,
                    color: liked ? Colors.red : MyColor.grey_color,
                  ),
                  onTap: () {
                    print("likeee $liked , $isl");

                    setState(() {
                      if (liked == true) {
                        liked = false;
                      } else {
                        liked = true;
                      }
                      //   isl++;
                      // liked=true;
                    });
                  },
                ),
                //margin: EdgeInsets.only(left: percent * 32.8)
              ),
              SizedBox(
                width: 15.0,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    liked = false;
    setState(() {
      artist_name_widget = Expanded(
        flex: 1,
        child: Container(
            child: Text(
              widget.music.artist,
              style: Text_Style.asrtist_style,
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.only(right: 5.0)),
      );
    });
  }
}
