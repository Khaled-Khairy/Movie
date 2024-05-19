import 'package:bloc/bloc.dart';

import '../../data/sea_all_services/sea_all_services.dart';
import '../../data/see_all_models/see_all_models.dart';

part 'sea_all_movies_state.dart';

class SeaAllMoviesCubit extends Cubit<SeeAllMoviesState> {
  final List<SeeAllModels> _seeAllMoviesList = [];
  int pageNumber = 1;

  SeaAllMoviesCubit() : super(SeeAllMoviesInitial());

  Future<void> fetchMovies(String category) async {
    if(pageNumber==1){
      emit(SeeAllMoviesLoading());
    }
    try {
      List<SeeAllModels> movies = await SeeAllServices().getSeeAllMovies(category,pageNumber);
      _seeAllMoviesList.addAll(movies);
      emit(SeeAllMoviesSuccess(moviesList: _seeAllMoviesList));
      pageNumber++;
    } catch (e) {
      emit(SeeAllMoviesFailed());
    }
  }
}
