class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  List<String>? genres;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel(
      {this.adult,
        this.backdropPath,
        this.genres,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.runtime,
        this.status,
        this.tagline,
        this.title,
        this.voteAverage,
        this.voteCount});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <String>[];
      json['genres'].forEach((genre) {
        genres!.add(genre['name']);
      });
    }
    overview = json['overview'];
    posterPath = "http://image.tmdb.org/t/p/original${json['poster_path']}";
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}