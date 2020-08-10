import 'package:just_audio/just_audio.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_music/bloc/music_event.dart';
import 'package:web_music/bloc/music_state.dart';
import 'package:web_music/model/music_model.dart';

class MusicBloc extends Bloc<Music_Event,MusicState>{


  //MusicBloc(this.mymusic);
 Music mymusic= Music("Summer feelings","Lennon Stella","http://dlera6.xyz/uploads/posts/2020-05/thumbs/1590824359_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/02/Oliva%20-%202020%20-%2001.%20The%20First%20to%20Arrive%20-%20bikalammusic.com.mp3");
 var isinit = false;
 var value = 0.0;
 final BehaviorSubject<double> value_subject = BehaviorSubject<double>();
 final BehaviorSubject<bool> isplay_subject = BehaviorSubject<bool>();
  String currentduration_subject = "";
 BehaviorSubject<String> duration_subject =  BehaviorSubject<String>();
  double maxSlider;
 AudioPlayer  player ;

 MusicBloc(){
   player = AudioPlayer();
   value_subject.add(0.0);

 }

  void  onGetData(Music music){
    mymusic = music;
    print("music ${mymusic.artist}");
    add(SendMusic());
  }
  void  onInitMusicEvent(){


    print("InitMusicEvent ");
    add(InitMusicEvent());
  }

  void  onFirsttMusicEvent(Music music){
    mymusic = music;

    print("FirstMusicEvent ");
    add(FirstMusicEvent());
  }

  @override
  MusicState get initialState => InitMusic(mymusic);

  @override
  Stream<MusicState> mapEventToState(Music_Event event) async*{
    // TODO: implement mapEventToState

    if( event is SendMusic){
      print("event ${mymusic.artist}");

      yield LoadMusic();
    }
    else if(event is InitMusicEvent){
      PlayerSetData();
      yield InitMusic(mymusic);
    }
    else if(event is FirstMusicEvent){
      PlayerSetData();
      yield FirstMusic(mymusic);


    }
  }


  PlayerSetData() async{
    if(isplay_subject==true){
      player.pause();

    }
    player.stop();
   var time=await player.setUrl(mymusic.url);
    duration_subject.add(time.inMinutes.toString() + ":" +
        (time.inSeconds.toInt()%60).toString());
    print("min ${time.inMinutes}");
    print("sec ${time.inSeconds}");
   maxSlider = time.inMilliseconds.toDouble();
  }

  play() async {
    isinit=true;
    if (isplay_subject.value == true) {
      // success
        player.pause();
        isplay_subject.add(false);
        print("isplay false paused");

    }
    else {
      player.play();
      isplay_subject.add(true);
        print("isplay true  resume");

    }
  }



}