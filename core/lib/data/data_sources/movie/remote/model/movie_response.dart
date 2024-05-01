import 'package:core/data/data_sources/movie/remote/model/movie_model.dart';
import 'package:equatable/equatable.dart';

class MovieResponse extends Equatable {
  MovieResponse({required this.movieList});

  final List<MovieModel> movieList;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<MovieModel>.from((json["results"] as List)
            .map((x) => MovieModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [movieList];
}
