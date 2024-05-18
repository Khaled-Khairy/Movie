part of 'movie_cubit.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieSuccess extends MovieState {
  final List<HomeMoviesModel> moviesList;

  MovieSuccess({required this.moviesList});
}

final class MovieLoading extends MovieState {}

final class MovieFailed extends MovieState {}




