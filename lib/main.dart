import 'package:flutter/material.dart';
import 'package:movie_clean_arc/core/service/services_locator.dart';
import 'package:movie_clean_arc/test.dart';

import 'core/utils/app_strings.dart';
import 'movies/domain/entities/movie.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
        home: const MoviesScreen()
        // home: const Test()
    );
  }
}
