import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_arc/core/utils/app_constants.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie_clean_arc/core/utils/enums.dart';

class PopularComponant extends StatefulWidget {
  const PopularComponant({super.key});

  @override
  State<PopularComponant> createState() => _PopularComponantState();
}

class _PopularComponantState extends State<PopularComponant> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        return switch (state.nowPlayingState) {
          RequestState.loading => const SizedBox(
            height: 170.0,
            child: Center(child: CircularProgressIndicator()),
          ),
          RequestState.loaded => FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          RequestState.error => SizedBox(
              height: 400,
              child: Center(child: Text(state.nowPlayingMessage)),
            ),
        };
      },
    );
  }
}
