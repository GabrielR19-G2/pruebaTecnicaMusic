import 'package:flutter/material.dart';
import 'package:music_app/router/app_routes.dart';
import 'package:music_app/screens/songs/list_songs_screen.dart';
import 'package:music_app/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height / 2.5),
      color: Colors.black,
      child: Column(
        children: [
          Text('¡Bienvenido!',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(
            height: size.height / 15,
          ),
          Button(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListSongsScreen())),
            textButton: 'Mostrar canciones',
          )
        ],
      ),
    ));
  }
}
