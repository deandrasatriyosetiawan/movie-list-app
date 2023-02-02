import "package:flutter/material.dart";
import "package:get/get.dart";
import "dart:async";
import "dart:convert" as convert;
import "package:http/http.dart" as http;
import "/routes/route_name.dart";
import "../splash_screen_page.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class ComedyGenrePage extends StatefulWidget {
  const ComedyGenrePage({super.key});

  @override
  State<ComedyGenrePage> createState() => _ComedyGenrePageState();
}

class _ComedyGenrePageState extends State<ComedyGenrePage> {
  List? comedyGenreMovie;
  static const String comedyGenreId = "35";

  Future<void> getJsonComedyGenreMovieData(BuildContext context) async {
    var response = await http
        .get(
      Uri.parse(
          // change <<your_api_key>> to your own api key
          "https://api.themoviedb.org/3/discover/movie?api_key=<<your_api_key>>&with_genres=$comedyGenreId"),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        throw TimeoutException("Connection time out. Try again.");
      },
    );
    print(response.body);
    setState(() {
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        comedyGenreMovie = jsonResponse["results"];
      }
    });
  }

  Future<void> _getRefreshData() async {
    await getJsonComedyGenreMovieData(context);
  }

  @override
  void initState() {
    _getRefreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: (comedyGenreMovie != null)
            ? Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 60, 0, 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(RouteName.homePage);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          iconSize: 25,
                          color: const Color(ColorManager.davyGrey),
                        ),
                        const SizedBox(
                          width: 54,
                        ),
                        const Text(
                          "Comedy Genre",
                          style: TextStyleManager.headerTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (comedyGenreMovie != null)
                          ? comedyGenreMovie!.length
                          : 0,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                          padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
                          width: 312,
                          height: 150,
                          decoration: BoxDecorationManager.movieBoxDecoration(
                              const Color(ColorManager.slateGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${comedyGenreMovie![index]["poster_path"]}",
                                    width: 96,
                                    height: 115,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${comedyGenreMovie![index]["title"]}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyleManager
                                            .lightTitleMovieTextStyle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "release date ${comedyGenreMovie![index]["release_date"]}",
                                      style: TextStyleManager
                                          .releaseDateAndRatingTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "rating ${comedyGenreMovie![index]["vote_average"]}",
                                      style: TextStyleManager
                                          .releaseDateAndRatingTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const SplashScreenPage(),
      ),
    );
  } // build
}
