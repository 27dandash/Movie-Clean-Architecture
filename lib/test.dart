import 'package:flutter/material.dart';
import 'package:movie_clean_arc/movies/presentation/screens/movies_screen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MoviesScreen();
            }));
          }, child:const Text('Navigator'),),),
        ],
      ),
    );
  }
}
