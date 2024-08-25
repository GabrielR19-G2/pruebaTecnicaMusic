
import 'package:music_app/models/song.dart';

enum SongsStatus { loading, success, error, initial }


class SongsState {
  SongsState({
    this.name,
    this.status = SongsStatus.initial,
    this.listSongs,
    this.isSelected,
    this.songDetail,
    this.selectedIndex,
  });

  final String? name;
  final SongsStatus status;
  final List<Song>? listSongs;
  final bool? isSelected;
  final Song? songDetail;
  final int? selectedIndex;

  SongsState copyWith({
    String? name,
    SongsStatus? status,
    List<Song>? listSongs,
    bool? isSelected,
    Song? songDetail,
    int? selectedIndex,
  }) {
    return SongsState(
      name: name ?? this.name,
      status: status ?? this.status,
      listSongs: listSongs ?? this.listSongs,
      isSelected: isSelected ?? this.isSelected,
      songDetail: songDetail ?? this.songDetail,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
