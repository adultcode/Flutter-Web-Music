import 'package:equatable/equatable.dart';
import 'package:web_music/model/music_model.dart';

abstract class MusicState extends Equatable{
  const MusicState();

  @override
  List<Object> get props => [];
}

class InitMusic extends MusicState{
  Music music;
  InitMusic(this.music);

  @override
  // TODO: implement props
  List<Object> get props => [music];
}
class FirstMusic extends MusicState{

  Music music;

  FirstMusic(this.music);

  @override
  // TODO: implement props
  List<Object> get props => [music];
}

class LoadMusic extends MusicState{
  //Music music;

  //LoadMusic(this.music);

  @override
  // TODO: implement props
  List<Object> get props => [];
}