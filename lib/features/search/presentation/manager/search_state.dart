part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<SearchModel> moviesList;

  SearchSuccess({required this.moviesList});
}
final class SearchLoading extends SearchState {}
final class SearchFailed extends SearchState {}
