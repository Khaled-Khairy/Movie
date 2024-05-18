import 'package:dio/dio.dart';

import '../models/movie_details_model.dart';

class MovieDetailsServices {
  final Dio dio = Dio();

  Future<MovieDetailsModel> getMovieDetails(int id) async {
    Response response = await dio.get(
        "https://api.themoviedb.org/3/movie/$id?api_key=9e0785cfb2af05b0d9eae95c9cfb8b02");
    Map<String, dynamic> jsonData = response.data;
    return MovieDetailsModel.fromJson(jsonData);
  }
}
