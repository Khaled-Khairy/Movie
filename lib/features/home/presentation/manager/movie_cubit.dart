import 'package:bloc/bloc.dart';
import '../../data/models/home_models.dart';
import '../../data/services/home_services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final List<HomeMoviesModel> _trendingMoviesList = [];
  final List<HomeMoviesModel> _popularMoviesList = [];
  final List<HomeMoviesModel> _nowPlayingMoviesList = [];
  final List<HomeMoviesModel> _topRatedMoviesList = [];
  final List<HomeMoviesModel> _upComingMoviesList = [];
  final String _apiKey = "9e0785cfb2af05b0d9eae95c9cfb8b02";

  MovieCubit() : super(MovieInitial());

  Future<void> fetchMovies(String endpoint, List<HomeMoviesModel> moviesList) async {
    emit(MovieLoading());
    try {
      List<HomeMoviesModel> movies = await HomeServices().getMovies(endpoint);
      moviesList.addAll(movies);
      emit(MovieSuccess(moviesList: moviesList));
    } catch (e) {
      emit(MovieFailed());
    }
  }

  void fetchTrendingMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/trending/movie/week?api_key=$_apiKey",
      _trendingMoviesList,
    );
  }

  void fetchPopularMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey",
      _popularMoviesList,
    );
  }

  void fetchNowPlayingMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey",
      _nowPlayingMoviesList,
    );
  }

  void fetchTopRatedMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey",
      _topRatedMoviesList,
    );
  }

  void fetchUpComingMovies() async {
    await fetchMovies(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey",
      _upComingMoviesList,
    );
  }
}
