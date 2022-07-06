import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movielist/main.dart';
import 'package:movielist/model/images_list.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  var movies;
  var movie_images;
  Color mainColor = const Color(0xff3C3261);

  final controller = ScrollController();
  int page = 2;
  bool isLoading = false;

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData(); //fetch data pertamakali

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getNewData();
      }
    });
  }

  Future getNewData() async {
    if (isLoading) return;
    isLoading = true;

    var apiKey = 'b61585778dd2dc119337bb02d0a8872f';
    var url =
        'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=${page}';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var newMovies = await json.decode(response.body);
      setState(() {
        page++;
        isLoading = false;
        movies.addAll(newMovies['results']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // getData();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Center(
            child: Text('Movie List'),
          )),
      body: new Padding(
        padding: const EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // new MovieTitle(mainColor),
            new Expanded(
              child: new ListView.builder(
                  controller: controller,
                  itemCount: movies == null ? 0 : movies.length + 1,
                  itemBuilder: (context, i) {
                    if (i < movies.length) {
                      return new TextButton(
                        child: new MovieCell(movies, i),
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) {
                            return new MovieDetail(movies[i]);
                          }));
                        },
                      );
                    } else {
                      getNewData();
                      return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

Future<Map> getJson() async {
  var apiKey = 'b61585778dd2dc119337bb02d0a8872f';
  var url =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=1';
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Text(
      'Top Rated',
      style: new TextStyle(
          fontSize: 40.0,
          color: mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oxygen'),
      textAlign: TextAlign.left,
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Card(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
              topRight: borderTopRight,
              bottomRight: borderBottomRight,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movies[i]['title'],
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oxygen'),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.star),
                          const SizedBox(height: 8.0),
                          Text(
                            "${movies[i]['vote_average']}/10",
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                          movies[i]['overview'].length > 120
                              ? "${movies[i]['overview'].substring(0, 120)}..."
                              : movies[i]['overview'],
                          style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Oxygen'),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: new BorderRadius.only(
                    topRight: borderTopRight,
                    bottomRight: borderBottomRight,
                  ),
                  child: Image.network(image_url + movies[i]['poster_path']),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
