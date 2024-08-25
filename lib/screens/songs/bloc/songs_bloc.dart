import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/songs/bloc/songs_event.dart';
import 'package:music_app/screens/songs/bloc/songs_state.dart';
import 'package:http/http.dart' as http;

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc() : super(SongsState()) {
    on<GetSongsList>(onGetSongsList);
    on<GetSongDetail>(onGetSongDetail);
    on<SetIsSelected>(onSetIsSelected);
  }

  void onGetSongsList(GetSongsList event, Emitter<SongsState> emit) async {
    try {
      emit(state.copyWith(status: SongsStatus.loading));
      final response = await http
          .get(Uri.parse('https://binteapi.com:4011/api/songs/examen/2'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> songsJson = jsonResponse['data'];
        final List<Song> songsList =
            songsJson.map((e) => Song.fromJson(e)).toList();

        print(songsList.first.name);
        emit(state.copyWith(status: SongsStatus.success, listSongs: songsList));
      }
    } catch (error) {
      print('[GetSongsList]: $error');
      emit(state.copyWith(status: SongsStatus.error));
    }
  }

  void onGetSongDetail(GetSongDetail event, Emitter<SongsState> emit) async {
    try {
      emit(state.copyWith(status: SongsStatus.loading));
      var songId = event.songId;
      if (songId > 0) {
        final response = await http.get(Uri.parse(
            'https://binteapi.com:4011/api/songs/examen/detail/$songId'));
        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);
          final songResponse = jsonResponse['data'];
          final song = Song.fromJson(songResponse);

          print(song.author);
          emit(state.copyWith(status: SongsStatus.success, songDetail: song));
        }
      } else {
        emit(state.copyWith(status: SongsStatus.error));
      }
    } catch (error) {
      print('[onGetSongDetail]: $error');
      emit(state.copyWith(status: SongsStatus.error));
    }
  }

  void onSetIsSelected(SetIsSelected event, Emitter<SongsState> emit) async {
    try {
      emit(state.copyWith(status: SongsStatus.loading));
      Future.delayed(Duration(milliseconds: 5000));
      emit(state.copyWith(status: SongsStatus.success));
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    } catch (error) {
      print('[onSetIsSelected]: $error');
      emit(state.copyWith(status: SongsStatus.error));
    }
  }
}
