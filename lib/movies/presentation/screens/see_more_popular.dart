import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_arc/core/service/services_locator.dart';
import 'package:movie_clean_arc/core/utils/app_constants.dart';
import 'package:movie_clean_arc/core/utils/app_strings.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import 'movie_detail_screen.dart';

class SeeMorePopular extends StatelessWidget {
  const SeeMorePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child:  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,

            title:const Text(AppString.popularMovies, style: TextStyle(fontSize: 20),),
            backgroundColor: Colors.black,
          ),
          body:BlocBuilder<MoviesBloc, MoviesState>(

            builder: (context, state) {

              return CarouselSlider(
                options: CarouselOptions(
                  height: 900.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.popularMovies.map(
                      (item) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.popularMovies.length,
                      itemBuilder: (context, index) {
                        print("item.id");
                        print(item.id);
                        final movie = state.popularMovies[index];
                        return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context){
                                  return MovieDetailScreen(movieId: item.id,);
                                }));
                              },
                              child: Card(
                                elevation: 4, // Add shadow to the card
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      ClipRRect(
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(8.0)),
                                        child: CachedNetworkImage(
                                          width: 140.0,
                                          height: 140,
                                          fit: BoxFit.cover,
                                          imageUrl: AppConstants.imageUrl(movie.backdropPath),
                                          placeholder: (context, url) => Shimmer.fromColors(
                                            baseColor: Colors.grey[850]!,
                                            highlightColor: Colors.grey[800]!,
                                            child: Container(
                                              height: 170.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.popularMovies[index].title,
                                            style: TextStyle(fontSize: 7),
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.red,
                                                child: Text(
                                                  state.popularMovies[index].releaseDate.toString().substring(0,4),
                                                  style: TextStyle(fontSize: 10,color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Icon(Icons.star, color: Colors.yellow, size: 10,),
                                              Text(
                                                state.popularMovies[index].voteAverage.toString().substring(0,3),
                                                style: TextStyle(fontSize: 10),
                                              ),

                                            ],
                                          ),
                                          Container(
                                            width: 186,
                                            child: Text(
                                              state.popularMovies[index].overView,
                                              style: TextStyle(fontSize: 7),
                                            ),
                                          ),
                                        ],
                                      )



                                    ],
                                  ),
                                ),
                              ),
                            )
                        );
                      },
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}