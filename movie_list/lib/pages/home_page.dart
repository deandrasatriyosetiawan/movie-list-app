import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:firebase_auth/firebase_auth.dart";
import "dart:async";
import "dart:convert" as convert;
import "package:http/http.dart" as http;
import "/configs/api_link.dart";
import "/routes/route_name.dart";
import "splash_screen_page.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final String? _emailUser = _firebaseAuth.currentUser!.email.toString();

  List? trendingMovie, topRatedMovie;

  Future<void> getJsonTrendingMovieData(BuildContext context) async {
    var response = await http
        .get(
      Uri.parse(ApiLink.trendingMovieUrl),
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
        trendingMovie = jsonResponse["results"];
      }
    });
  }

  Future<void> getJsonTopRatedMovieData(BuildContext context) async {
    var response = await http
        .get(
      Uri.parse(ApiLink.topRatedMovieUrl),
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
        topRatedMovie = jsonResponse["results"];
      }
    });
  }

  Future<void> _getRefreshData() async {
    await getJsonTrendingMovieData(context);
    await getJsonTopRatedMovieData(context);
  }

  @override
  void initState() {
    _getRefreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: (trendingMovie != null && topRatedMovie != null)
            ? Container(
                margin: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hello,",
                              style: TextStyleManager.standardTextStyle,
                            ),
                            Text(
                              _emailUser!,
                              style: TextStyleManager.standardTextStyle,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(RouteName.profilePage);
                          },
                          icon: const Icon(Icons.account_circle),
                          iconSize: 30,
                          color: const Color(ColorManager.davyGrey),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Trending",
                            style: TextStyleManager.subheaderTextStyle,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RouteName.trendingPage);
                            },
                            child: const Text(
                              "See all",
                              style: TextStyleManager.seeAllTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
                      width: 312,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(ColorManager.iceberg),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox.fromSize(
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${trendingMovie![0]["poster_path"]}",
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
                                    "${trendingMovie![0]["title"]}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyleManager
                                        .blueKoiTitleMovieTextStyle,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "release date ${trendingMovie![0]["release_date"]}",
                                  style: TextStyleManager
                                      .releaseDateAndRatingTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "rating ${trendingMovie![0]["vote_average"]}",
                                  style: TextStyleManager
                                      .releaseDateAndRatingTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Top Rated",
                            style: TextStyleManager.subheaderTextStyle,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RouteName.topRatedPage);
                            },
                            child: const Text(
                              "See all",
                              style: TextStyleManager.seeAllTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            topRatedMovie == null ? 0 : topRatedMovie!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 24),
                            decoration: BoxDecorationManager.movieBoxDecoration(
                                const Color(ColorManager.iceberg)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox.fromSize(
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${topRatedMovie![index]["poster_path"]}",
                                  width: 108,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Genre",
                            style: TextStyleManager.subheaderTextStyle,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.iceberg)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.actionGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "action",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.blueKoi)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.adventureGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "adventure",
                                    style: TextStyleManager
                                        .genreButtonLightTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.iceberg)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.animationGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "animation",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.slateGrey)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.comedyGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "comedy",
                                    style: TextStyleManager
                                        .genreButtonLightTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.lightGrey)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.familyGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "family",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.iceberg)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.fantasyGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "fantasy",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.blueKoi)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.horrorGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "horror",
                                    style: TextStyleManager
                                        .genreButtonLightTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.iceberg)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.mysteryGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "mistery",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.slateGrey)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.romanceGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "romance",
                                    style: TextStyleManager
                                        .genreButtonLightTextStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 83,
                                height: 30,
                                decoration: BoxDecorationManager
                                    .genreButtonBoxDecoration(
                                        const Color(ColorManager.lightGrey)),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.thrillerGenrePage);
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.only(bottom: 2)),
                                  ),
                                  child: const Text(
                                    "thriller",
                                    style: TextStyleManager
                                        .genreButtonDarkTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SplashScreenPage(),
      ),
    );
  } // build
}
