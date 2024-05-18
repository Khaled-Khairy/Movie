import 'package:bloc/bloc.dart';

import '../../data/models/search_model.dart';
import '../../data/services/search_services.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final List<SearchModel> _searchMoviesList = [];
  int pageNumber = 1;
  fetchSearchMovies(String searchKey)async{
    if(pageNumber == 1){
      emit(SearchLoading());
    }
    try{
      List<SearchModel> moviesList = await SearchServices().getSearchMovies(searchKey, pageNumber);
      if(moviesList.isNotEmpty){
        pageNumber++;
        _searchMoviesList.addAll(moviesList);
      }
      emit(SearchSuccess(moviesList: _searchMoviesList));
    }catch(e){
      emit(SearchFailed());
    }
  }
}
