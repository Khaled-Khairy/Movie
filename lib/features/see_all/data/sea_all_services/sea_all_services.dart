import 'package:dio/dio.dart';

import '../see_all_models/see_all_models.dart';


class SeeAllServices{
  final Dio dio = Dio();
  final String _apiKey = "9e0785cfb2af05b0d9eae95c9cfb8b02";
  Future<List<SeeAllModels>> getSeeAllMovies(String category,int pageNumber)async{
    Response response = await dio.get("https://api.themoviedb.org/3/movie/$category?api_key=$_apiKey&page=$pageNumber");
    Map<String,dynamic> jsonData = response.data;
    List<dynamic> results = jsonData["results"];
    List<SeeAllModels> movies = results.map((movie)=>SeeAllModels.fromJson(movie)).toList();
    return movies;
  }
}