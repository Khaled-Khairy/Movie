part of 'sea_all_movies_cubit.dart';

sealed class SeeAllMoviesState {}

final class SeeAllMoviesInitial extends SeeAllMoviesState {}

final class SeeAllMoviesSuccess extends SeeAllMoviesState {
  final List<SeeAllModels> moviesList;

  SeeAllMoviesSuccess({required this.moviesList});
}

final class SeeAllMoviesLoading extends SeeAllMoviesState {}

final class SeeAllMoviesFailed extends SeeAllMoviesState {}

final class SeeAllMoviesPaginationSuccess extends SeeAllMoviesState {}

final class SeeAllMoviesPaginationLoading extends SeeAllMoviesState {}

final class SeeAllMoviesPaginationFailed extends SeeAllMoviesState {}
