import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/screens/songs/bloc/songs_bloc.dart';
import 'package:music_app/screens/songs/bloc/songs_event.dart';
import 'package:music_app/screens/songs/bloc/songs_state.dart';
import 'package:music_app/widgets/loading_screen.dart';

class ListSongsScreen extends StatelessWidget {
  const ListSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Canciones disponibles'),
        ),
        body: BlocProvider(
          create: (context) => SongsBloc()..add(GetSongsList()),
          child: BlocBuilder<SongsBloc, SongsState>(
            builder: (context, state) {
              if (state.status == SongsStatus.loading) {
                return const LoadingScreen();
              }
              return ListView.separated(
                itemCount: state.listSongs?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    selected: state.selectedIndex == index,
                    selectedColor: Colors.white,
                    tileColor: (state.selectedIndex == index)
                        ? Colors.black
                        : Colors.white,
                    selectedTileColor: (state.selectedIndex == index)
                        ? Colors.lightBlueAccent[400]
                        : Colors.white,
                    title: Text('${state.listSongs?[index].name}'),
                    trailing: Icon(Icons.info,
                        color: state.selectedIndex == index
                            ? Colors.white
                            : Colors.blue),
                    onTap: () {
                      context.read<SongsBloc>().add(SetIsSelected(index));
                      print('${state.listSongs?.first.id}');
                      Navigator.pushNamed(
                        context,
                        '/songDetails',
                        arguments: {'song': state.listSongs![index]},
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            },
          ),
        ));
  }
}
