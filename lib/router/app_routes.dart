import 'package:flutter/material.dart';
import 'package:music_app/models/menu_option.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/songs/song_details.dart';
import 'package:music_app/screens/songs/list_songs_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final routsOptions = <MenuOption>[
    MenuOption(
        route: '/songsList',
        routeName: 'Listado de canciones',
        screen: const ListSongsScreen()),
    MenuOption(
        route: '/songDetails',
        routeName: 'Detalles de la canción',
        screen: const SongDetails())
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'SongsList': (BuildContext context) => const ListSongsScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case '/songDetails':
        final Song? song = args?['song'];
        final int songId = song?.id ?? 0;
        return MaterialPageRoute(
          builder: (context) => SongDetails(
            songId: songId ?? 0,
          ), 
        );
      default:
    }
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
