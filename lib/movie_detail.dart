import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movielist/main_screen.dart';
import 'package:movielist/model/movie_list.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class MovieDetail extends StatelessWidget {
  final movie;
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

class DetailMobilePage extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  DetailMobilePage(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
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
            // Container(
            //   height: 150,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: mov.imageUrls.map((url) {
            //       return Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(10),
            //           child: Image.network(url),
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),
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
//   final movie;
//   var image_url = 'https://image.tmdb.org/t/p/w500/';
//   DetailWebPage(this.movie);
//   Color mainColor = const Color(0xff3C3261);

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
