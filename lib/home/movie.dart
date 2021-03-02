import 'dart:async';

class Movie {
  String title;
  String posterPath;

  Movie({this.title, this.posterPath});

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "poster_path": this.posterPath,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      posterPath: json["poster_path"],
    );
  }


}