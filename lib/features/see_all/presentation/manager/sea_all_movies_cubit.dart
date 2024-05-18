import 'package:bloc/bloc.dart';

import '../../data/sea_all_services/sea_all_services.dart';
import '../../data/see_all_models/see_all_models.dart';

part 'sea_all_movies_state.dart';

class SeaAllMoviesCubit extends Cubit<SeeAllMoviesState> {
  final List<SeeAllModels> _popularMoviesList = [];
  final List<SeeAllModels> _nowPlayingMoviesList = [];
  final List<SeeAllModels> _topRatedMoviesList = [];
  final List<SeeAllModels> _upComingMoviesList = [];
  final String _apiKey = "9e0785cfb2af05b0d9eae95c9cfb8b02";
  int pageNumber = 1;

  SeaAllMoviesCubit() : super(SeeAllMoviesInitial());

  Future<void> fetchMovies(String endpoint, List<SeeAllModels> moviesList) async {
    if(pageNumber==1){
      emit(SeeAllMoviesLoading());
    }
    try {
      List<SeeAllModels> movies = await SeeAllServices().getSeeAllMovies(endpoint);
      moviesList.addAll(movies);
      emit(SeeAllMoviesSuccess(moviesList: moviesList));
      pageNumber++;
    } catch (e) {
      emit(SeeAllMoviesFailed());
    }
  }
  void fetchPopularMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$pageNumber",
      _popularMoviesList,
    );
  }

  void fetchNowPlayingMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&page=$pageNumber",
      _nowPlayingMoviesList,
    );
  }

  void fetchTopRatedMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey&page=$pageNumber",
      _topRatedMoviesList,
    );
  }

  void fetchUpComingMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&page=$pageNumber",
      _upComingMoviesList,
    );
  }
}
