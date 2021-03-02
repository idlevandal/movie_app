
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/environment_config.dart';
import 'package:movie_app/home/movie.dart';
import 'package:movie_app/home/movies_exeption.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._environmentConfig, this._dio);

  // final EnvironmentConfig _environmentConfig;
  final String _environmentConfig;
  final Dio _dio;

  final String apiKey = '33fd256b35409bd80ff86645ea2bceb0';

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1'
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results.map((movieData) => Movie.fromJson(movieData)).toList(growable: false);

      return movies;
    } on DioError catch (e) {
      throw MoviesException.fromDioError(e);
    }
  }
}