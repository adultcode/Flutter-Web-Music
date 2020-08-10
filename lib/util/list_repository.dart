import 'package:web_music/model/music_model.dart';

class MusicListRepo{

  List<Music> _mylist;

   Music _mymusicrepo;

  Music getMusic(){

    _mymusicrepo=Music("TQ Y YA","Danna Paola","http://dlera6.xyz/uploads/posts/2020-06/thumbs/1593153064_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/01/ROMAK%20-%20Your%20Hair%20Fragrance%20(2020)%20128.mp3");
    return _mymusicrepo;
  }

  List<Music> getmylist(){
    _mylist = List();
    _mylist.add(Music("Like This","G Herbo","http://dlera6.xyz/uploads/posts/2020-05/thumbs/1590824359_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/02/Amin%20Amiri%20-%20A%20Good%20Day%20Will%20Come%20(2020)%20128.mp3"));

    _mylist.add(Music("TQ Y YA","Danna Paola","http://dlera6.xyz/uploads/posts/2020-06/thumbs/1593153064_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/01/ROMAK%20-%20Your%20Hair%20Fragrance%20(2020)%20128.mp3"));
    _mylist.add(Music("Smile","Katy","http://dlera6.xyz/uploads/posts/2020-07/thumbs/1594305002_600x600bb.jpg","http://dl2.bikalammusic.com/new-links/99/01/Gary%20Schmidt%20-%202020%20-%2010.%20Nocturne%20in%20C%20m%20-%20bikalammusic.com.mp3"));
    _mylist.add(Music("Summer Feelings","Lennon Stella","http://dlera6.xyz/uploads/posts/2020-07/thumbs/1593756594_600x600bb.jpg",""));
    _mylist.add(Music("In The Mirror","Demi Lovato","http://dlera6.xyz/uploads/posts/2020-06/thumbs/1593103121_600x600bb.jpg",""));
    _mylist.add(Music("Dance Dance Dance","Astrid S","http://dlera6.xyz/uploads/posts/2020-06/thumbs/1591338002_600x600bb.jpg",""));

    _mylist.add(Music("The Adventures of..","Kid Cudi & Eminem","http://dlera6.xyz/uploads/posts/2020-07/thumbs/1594447667_600x600bb.jpg",""));
    _mylist.add(Music("For The Night","Grey ","http://dlera6.xyz/uploads/posts/2020-05/thumbs/1590823715_600x600bb.jpg",""));
    _mylist.add(Music("Fuego Del Calor","Scott Storch","http://dlera6.xyz/uploads/posts/2020-05/thumbs/1590685765_600x600bb.jpg",""));

    return _mylist;
  }

  set mylist(List<Music> value) {
    _mylist = value;
  }
}