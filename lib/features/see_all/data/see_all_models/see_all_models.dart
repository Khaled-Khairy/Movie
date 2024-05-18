class SeeAllModels {
  bool? adult;
  int? id;
  String? posterPath;
  String? title;
  double? voteAverage;

  SeeAllModels({
    this.adult,
    this.id,
    this.posterPath,
    this.title,
    this.voteAverage,
  });

  SeeAllModels.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    id = json['id'];
    posterPath = "http://image.tmdb.org/t/p/original${json['poster_path']}";
    title = json['title'];
    voteAverage = json['vote_average'];
  }
}
