import 'dart:convert';

List<MovieImages> movieImagesFromJson(String str) =>
    List<MovieImages>.from(json.decode(str).map((x) => MovieImages.fromMap(x)));

class MovieImages {
  MovieImages({
    required this.file_path,
  });

  String file_path;

  factory MovieImages.fromMap(Map<String, dynamic> json) => MovieImages(
        file_path: 'https://image.tmdb.org/t/p/w500/' + json["file_path"],
      );
}
