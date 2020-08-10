import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_music/model/music_model.dart';

class NowBloc{

  final BehaviorSubject<Music> _subject = BehaviorSubject<Music>();
 Music _mymusicrepo=Music("TQ Y YA","Danna Paola","http://dlera6.xyz/uploads/posts/2020-06/thumbs/1593153064_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/01/ROMAK%20-%20Your%20Hair%20Fragrance%20(2020)%20128.mp3");

  getTodos() async{
    _subject.sink.add(_mymusicrepo);
  }
  void drainStream(){_subject.value = null; }

  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<Music> get subject => _subject;


}
final todosbloc = NowBloc();