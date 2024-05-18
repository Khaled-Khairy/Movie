class HomeMoviesModel {
  bool? adult;
  int? id;
  String? posterPath;
  String? title;
  double? voteAverage;

  HomeMoviesModel(
      {this.adult,
        this.id,
        this.posterPath,
        this.title,
        this.voteAverage,
        });

  HomeMoviesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    id = json['id'];
    posterPath = "http://image.tmdb.org/t/p/original${json['poster_path']}";
    title = json['title'];
    voteAverage = json['vote_average'];
  }
}