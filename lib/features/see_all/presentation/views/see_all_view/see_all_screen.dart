import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/sea_all_movies_cubit.dart';
import '../widgets/see_all_body.dart';


class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return BlocProvider(
      create: (context) => getMovieCubitForCategory(category),
      child: SeeAllBody(category: category,),
    );
  }
}
SeaAllMoviesCubit getMovieCubitForCategory(String category) {
  switch (category) {
    case "Popular":
      return SeaAllMoviesCubit()..fetchPopularMovies();
    case "TopRated":
      return SeaAllMoviesCubit()..fetchTopRatedMovies();
    case "Upcoming":
      return SeaAllMoviesCubit()..fetchUpComingMovies();
    case "NowPlaying":
      return SeaAllMoviesCubit()..fetchNowPlayingMovies();
    default:
      return SeaAllMoviesCubit()..fetchPopularMovies();
  }
}

