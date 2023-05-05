import 'package:flutter/material.dart';
import 'package:iti_flutter_project/data/model/MovieResponse.dart';
import 'package:iti_flutter_project/data/datasource/remote/API.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
              "assets/images/png-transparent-computer-icons-movie-projector-multimedia-projectors-film-movie-theatre-electronics-text-rectangle.png"),
          title: Text("Movie DB"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Column(children: [
              FutureBuilder(
                future: APIService.api.showMovieData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MovieResponse responses = snapshot.data!;
                    List<Results> movies = responses.results!;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: MovieResponse.Results?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _navigateToMovie(MovieResponse.results![index]);
                              },
                            ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ])),
          ),
        ));
  }
}
