part of 'movie_details_cubit.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsSuccess extends DetailsState {
  final MovieDetailsModel movieDetails;

  DetailsSuccess({required this.movieDetails});
}
final class DetailsLoading extends DetailsState {}
final class DetailsFailed extends DetailsState {}

