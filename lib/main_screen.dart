import 'package:flutter/material.dart';
import 'package:movielist/detail_screen.dart';
import 'package:movielist/model/movie_list.dart';

const primaryColor = Color(0xFF151026);
const borderTopRight = const Radius.circular(10.0);
const borderBottomRight = const Radius.circular(40.0);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text('Movie List'),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const MovieList();
              } else if (constraints.maxWidth <= 1200) {
                return const MovieGrid(gridCount: 4);
              } else {
                return const MovieGrid(gridCount: 6);
              }
            },
          ),
        );
      },
    );
  }
}

class MovieGrid extends StatelessWidget {
  final int gridCount;

  const MovieGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: movieList.map((mov) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(mov: mov);
                }));
              },
              child: Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(15.0),
                // ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        mov.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        mov.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        mov.genres,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.star),
                          const SizedBox(height: 8.0),
                          Text(
                            mov.rating,
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.person),
                          const SizedBox(height: 8.0),
                          Text(
                            mov.writer,
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Movie mov = movieList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(mov: mov);
              }));
            },
            child: Card(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mov.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(mov.genres),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.star),
                              const SizedBox(height: 8.0),
                              Text(
                                mov.rating,
                                style: informationTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.person),
                              const SizedBox(height: 8.0),
                              Text(
                                mov.writer,
                                style: informationTextStyle,
                              ),
                            ],
                          ),
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
                      child: Image.asset(
                        mov.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: movieList.length,
      ),
    );
  }
}
