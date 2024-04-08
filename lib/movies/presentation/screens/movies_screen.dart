import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_clean_arc/core/service/services_locator.dart';
import 'package:movie_clean_arc/core/utils/app_strings.dart';
import 'package:movie_clean_arc/movies/presentation/componemt/now_playing_component.dart';
import 'package:movie_clean_arc/movies/presentation/componemt/popular_component.dart';
import 'package:movie_clean_arc/movies/presentation/componemt/top_rated_component.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean_arc/movies/presentation/screens/see_more_popular.dart';
import 'package:movie_clean_arc/movies/presentation/screens/see_more_top_rated.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.popular,
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return  SeeMorePopular();
                          }));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16.0, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponant(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.topRated,
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const SeeMoreTopRated();
                          }));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16.0, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
