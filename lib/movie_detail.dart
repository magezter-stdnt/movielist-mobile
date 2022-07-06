import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movielist/main_screen.dart';
import 'package:movielist/model/movie_list.dart';
import 'package:movielist/model/images_list.dart';
import 'package:http/http.dart' as http;
import 'package:movielist/movie_list.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class MovieDetail extends StatelessWidget {
  final movie;
  // final List<Backdrops>? movieImages;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // if (constraints.maxWidth > 800) {
        //   // return DetailWebPage(movie);
        // } else {
        return DetailMobilePage(movie);
        // }
      },
    );
  }
}

class DetailMobilePage extends StatefulWidget {
  final movie;

  DetailMobilePage(this.movie);

  @override
  DetailMobilePageState createState() => DetailMobilePageState(this.movie);
}

class DetailMobilePageState extends State<DetailMobilePage> {
  final movie;

  DetailMobilePageState(this.movie);
  // final List<Backdrops>? movieImages;
  // Backdrops? movie_backdrops;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  Color mainColor = const Color(0xff3C3261);
  late Future<List<Backdrops>> futureBackdrops;

  @override

  // Future<List<MovieImages>> fetchPost() async {
  //   var apiKey = 'b61585778dd2dc119337bb02d0a8872f';
  //   final response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/${movie['id']}/images?api_key=${apiKey}'));

  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  //     return parsed
  //         .map<MovieImages>((json) => MovieImages.fromMap(json))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  // void getImages(var movieID) async {
  //   // await Future.delayed(Duration(seconds: 3));
  //   movie_backdrops = await getImagesJson(movieID);
  //   if (movie_backdrops != null) {
  //     print('THIS success -> ${movie_backdrops}');
  //   }
  //   // else {
  //   print('THIS fail -> ${movie_backdrops}');
  //   // }
  // }

  void initState() {
    super.initState();
    futureBackdrops = getImagesJson(movie['id']);
  }

  @override
  Widget build(BuildContext context) {
    // getImages(movie['id']);
    // print('ID -> ${movie['id']}');
    // print('THIS - inside -> ${movie_backdrops}');
    // print('THIS -> ${movie_backdrops}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                new Image.network(
                  image_url + movie['poster_path'],
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                // mov.name,
                movie['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        // mov.releaseDate,

                        movie['release_date'],
                        textAlign: TextAlign.center,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.star),
                      const SizedBox(height: 8.0),
                      Text(
                        // mov.rating,
                        '${movie['vote_average']}/10',
                        textAlign: TextAlign.center,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.person),
                      const SizedBox(height: 8.0),
                      Text(
                        // mov.writer,
                        movie['original_language'],
                        textAlign: TextAlign.center,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Backdrops>>(
              future: getImagesJson(movie['id']),
              // initialData: null, // You can set a default value here.
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data![0]['filePath']);
                  return Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctxt, int i) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  image_url + snapshot.data![i].filePath),
                            ),
                          );
                        },
                      ));
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                movie['overview'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    Text(
                      'Beli Sekarang',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailWebPage extends StatefulWidget {
// final movie;
// final List<Backdrops>? movieImages;
// var image_url = 'https://image.tmdb.org/t/p/w500/';
// DetailWebPage(this.movie, this.movieImages);
// Color mainColor = const Color(0xff3C3261);

//   @override
//   _DetailWebPageState createState() => _DetailWebPageState();
// }

// class _DetailWebPageState extends State<DetailWebPage> {
//   final _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: kIsWeb ? null : AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: 16,
//           horizontal: 64,
//         ),
//         child: Center(
//           child: Container(
//             width: screenWidth <= 1200 ? 800 : 1200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text(
//                   'Movie List',
//                   style: TextStyle(
//                     fontFamily: 'Staatliches',
//                     fontSize: 32,
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             child: Image.asset(widget.mov.imageAsset),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           const SizedBox(height: 16),
//                           Scrollbar(
//                             isAlwaysShown: true,
//                             controller: _scrollController,
//                             child: Container(
//                               height: 150,
//                               padding: const EdgeInsets.only(bottom: 16),
//                               child: ListView(
//                                 controller: _scrollController,
//                                 scrollDirection: Axis.horizontal,
//                                 children: widget.mov.imageUrls.map((url) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Image.network(url),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 32),
//                     Expanded(
//                       child: Card(
//                         child: Container(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Container(
//                                 child: Text(
//                                   widget.mov.name,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                     fontSize: 30.0,
//                                     fontFamily: 'Staatliches',
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: <Widget>[
//                                       const Icon(Icons.calendar_today),
//                                       const SizedBox(width: 8.0),
//                                       Text(
//                                         widget.mov.releaseDate,
//                                         style: informationTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                   const FavoriteButton(),
//                                 ],
//                               ),
//                               Row(
//                                 children: <Widget>[
//                                   const Icon(Icons.star),
//                                   const SizedBox(width: 8.0),
//                                   Text(
//                                     widget.mov.rating,
//                                     style: informationTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 8.0),
//                               Row(
//                                 children: <Widget>[
//                                   const Icon(Icons.person),
//                                   const SizedBox(width: 8.0),
//                                   Text(
//                                     widget.mov.writer,
//                                     style: informationTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16.0),
//                                 child: Text(
//                                   widget.mov.description,
//                                   textAlign: TextAlign.justify,
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     fontFamily: 'Oxygen',
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

Future<List<Backdrops>> getImagesJson(var movieID) async {
  var apiKey = 'b61585778dd2dc119337bb02d0a8872f';
  var url =
      'https://api.themoviedb.org/3/movie/${movieID}/images?api_key=${apiKey}';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('STATUSCODE==200 from movie_detail getImagesJson');

    List<Backdrops> list = List<Backdrops>.from(
        (json.decode(response.body)['backdrops'])
            .map((json) => Backdrops.fromJson(json)));
    print(list);
    return list;
  } else {
    print('STATUSCODE NOT 200 from movie_detail getImagesJson');

    throw new Error();
  }
}
