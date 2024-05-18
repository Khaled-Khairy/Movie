import 'package:bloc/bloc.dart';

import '../../data/models/movie_details_model.dart';
import '../../data/services/movie_details_services.dart';

part 'movie_details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  fetchMovieDetails(int id) async {
    emit(DetailsLoading());
    try {
      MovieDetailsModel movieDetails = await MovieDetailsServices().getMovieDetails(id);
      emit(DetailsSuccess(movieDetails: movieDetails));
    } catch (e) {
      emit(DetailsFailed());
    }
  }
}
