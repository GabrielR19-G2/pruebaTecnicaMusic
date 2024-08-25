import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/screens/songs/bloc/songs_bloc.dart';
import 'package:music_app/screens/songs/bloc/songs_event.dart';
import 'package:music_app/screens/songs/bloc/songs_state.dart';
import 'package:music_app/widgets/loading_screen.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({
    super.key,
    this.songId,
  });

  final int? songId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongsBloc()..add(GetSongDetail(songId ?? 0)),
      child: BlocBuilder<SongsBloc, SongsState>(
        builder: (context, state) {
          if (state.status == SongsStatus.loading) {
            return const LoadingScreen();
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              title: Text(state.songDetail?.name ?? '',
                  style: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SongTitle(
                    songAuthor: state.songDetail?.author ?? '',
                    songName: state.songDetail?.name ?? '',
                  ),
                  Visibility(
                    visible: state.songDetail?.letter?.isNotEmpty ?? false,
                    child: About(
                      title: 'Letra:',
                      letter: state.songDetail?.letter ?? '',
                      pathSong: state.songDetail?.pathSong,
                    ),
                  ),
                  Visibility(
                    visible: state.songDetail?.musicNote?.isNotEmpty ?? false,
                    child: About(
                      title: 'Más detalles',
                      letter: state.songDetail?.musicNote ?? '',
                      pathSong: state.songDetail?.pathSong,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SongTitle extends StatelessWidget {
  SongTitle({required this.songName, required this.songAuthor});
  final String? songName;
  final String? songAuthor;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.black)),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songName ?? '',
                  style: textTheme.headlineLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.red),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Autor: $songAuthor',
                      // 'Autor: ',
                      style: textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class About extends StatelessWidget {
  const About({super.key, this.letter, this.title, this.pathSong});
  final String? letter;
  final String? title;
  final String? pathSong;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Visibility(
      visible: letter != null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Text('$title', style: TextStyle(fontSize: 20)),
            Text('$letter',
                textAlign: TextAlign.justify, style: textTheme.subtitle1),
            Text('$pathSong',
                textAlign: TextAlign.justify, style: textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
