import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movielist/main.dart';
import 'package:movielist/model/images_list.dart';
import 'movie_detail.dart';
// import 'config.dart';

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
  // final movs = json.decode(response.body);
  // print(json.decode(response2.body));

  // return movs;
  return json.decode(response.body);
}

Future<Map> getJson2() async {
  var apiKey = 'b61585778dd2dc119337bb02d0a8872f';

  var url2 =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=2';
  var response2 = await http.get(Uri.parse(url2));
  // final movs = json.decode(response.body);
  // print(json.decode(response2.body));

  // return movs;
  return json.decode(response2.body);
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    // return new Padding(
    // padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    // child:
    return new Text(
      'Top Rated',
      style: new TextStyle(
          fontSize: 40.0,
          color: mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arvo'),
      textAlign: TextAlign.left,
    );
    // );
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
                            fontSize: 20.0, color: primaryColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // MainAxisAlignment.end,
                        movies[i]['original_language'],
                      ),
                      const SizedBox(
                        height: 30,
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
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: <Widget>[
                      //     const Icon(Icons.person),
                      //     const SizedBox(height: 8.0),
                      //     Text(
                      //       'test',
                      //       style: informationTextStyle,
                      //     ),
                      //   ],
                      // ),
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
