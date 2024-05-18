import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/colors.dart';
import '../../../data/see_all_models/see_all_models.dart';
import '../../manager/sea_all_movies_cubit.dart';
import 'grid_card.dart';

class SeeAllBody extends StatelessWidget {
  final String category;

  const SeeAllBody({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          title: Text(
            getCategoryTitle(category),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTextColor,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff0f0f0f),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: kTextColor,
              )),
        ),
        body: BlocBuilder<SeaAllMoviesCubit, SeeAllMoviesState>(
          builder: (context, state) {
            if (state is SeeAllMoviesSuccess) {
              final movies = getMoviesForCategory(category, state);
              return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      getMovieCubitForPage(context, category);
                    }
                    return true;
                  },
                  child: GridCard(movies: movies));
            } else if (state is SeeAllMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xfff1f1f1),
                ),
              );
            } else if (state is SeeAllMoviesFailed) {
              return Center(
                  child: Text(
                "Failed to Load ${getCategoryTitle(category)}",
                style: const TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
              ));
            }
            return const Text("Unknown State");
          },
        ),
      ),
    );
  }

  String getCategoryTitle(String category) {
    switch (category) {
      case "Popular":
        return "Popular";
      case "TopRated":
        return "Top Rated";
      case "Upcoming":
        return "Upcoming";
      case "NowPlaying":
        return "Now Playing";
      default:
        return "All";
    }
  }
  SeaAllMoviesCubit getMovieCubitForPage(BuildContext context, String category) {
    final movieCubit = BlocProvider.of<SeaAllMoviesCubit>(context);
    switch (category) {
      case "Popular":
        movieCubit.fetchPopularMovies();
        break;
      case "TopRated":
        movieCubit.fetchTopRatedMovies();
        break;
      case "Upcoming":
        movieCubit.fetchUpComingMovies();
        break;
      case "NowPlaying":
        movieCubit.fetchNowPlayingMovies();
        break;
      default:
        movieCubit.fetchPopularMovies();
    }
    return movieCubit;
  }
  List<SeeAllModels> getMoviesForCategory(String category, SeeAllMoviesSuccess state) {
    switch (category) {
      case "Popular":
        return state.moviesList;
      case "TopRated":
        return state.moviesList;
      case "Upcoming":
        return state.moviesList;
      case "NowPlaying":
        return state.moviesList;
      default:
        return [];
    }
  }
}
