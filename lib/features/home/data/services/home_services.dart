import 'package:dio/dio.dart';

import '../models/home_models.dart';

class HomeServices {
  final Dio dio = Dio();

  Future<List<HomeMoviesModel>> getMovies(String endpoint) async {
    Response response = await dio.get(endpoint);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> results = jsonData["results"];
    List<HomeMoviesModel> movies = results.map((movie)=>HomeMoviesModel.fromJson(movie)).toList();
    return movies;
  }
}
