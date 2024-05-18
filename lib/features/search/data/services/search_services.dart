import 'package:dio/dio.dart';

import '../models/search_model.dart';

class SearchServices{
  final Dio dio = Dio();
   Future<List<SearchModel>> getSearchMovies(String searchKey,int pageNumber)async{
    Response response = await dio.get("https://api.themoviedb.org/3/search/movie?query=$searchKey&api_key=9e0785cfb2af05b0d9eae95c9cfb8b02&page=$pageNumber");
    Map<String,dynamic> jsonData = response.data;
    List<dynamic> results = jsonData["results"];
    List<SearchModel> movies = results.map((movie)=>SearchModel.fromJson(movie)).toList();
    return movies;
  }
}