import 'package:dio/dio.dart';

import '../see_all_models/see_all_models.dart';


class SeeAllServices{
  final Dio dio = Dio();
  Future<List<SeeAllModels>> getSeeAllMovies(String endpoint)async{
    Response response = await dio.get(endpoint);
    Map<String,dynamic> jsonData = response.data;
    List<dynamic> results = jsonData["results"];
    List<SeeAllModels> movies = results.map((movie)=>SeeAllModels.fromJson(movie)).toList();
    return movies;
  }
}