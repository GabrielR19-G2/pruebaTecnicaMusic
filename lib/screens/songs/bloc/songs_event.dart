// part of 'songs_bloc.dart';

abstract class SongsEvent {}

class GetSongsList extends SongsEvent {
  GetSongsList();
}

class GetSongDetail extends SongsEvent {
  GetSongDetail(this.songId);
  final int songId;
}

class SetIsSelected extends SongsEvent {
  SetIsSelected(this.selectedIndex);
  final int selectedIndex;
}
