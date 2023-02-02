import "package:flutter/material.dart";
import "package:get/get.dart";
import "dart:async";
import "dart:convert" as convert;
import "package:http/http.dart" as http;
import "/pages/splash_screen_page.dart";
import "/configs/api_link.dart";
import "/routes/route_name.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List? trendingMovie;

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

  Future<void> _getRefreshData() async {
    await getJsonTrendingMovieData(context);
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
        child: (trendingMovie != null)
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
                          width: 80,
                        ),
                        const Text(
                          "Trending",
                          style: TextStyleManager.headerTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          trendingMovie == null ? 0 : trendingMovie!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                          padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
                          width: 312,
                          height: 150,
                          decoration: BoxDecorationManager.movieBoxDecoration(
                              const Color(ColorManager.iceberg)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${trendingMovie![index]["poster_path"]}",
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
                                        "${trendingMovie![index]["title"]}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyleManager
                                            .blueKoiTitleMovieTextStyle,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "release date ${trendingMovie![index]["release_date"]}",
                                      style: TextStyleManager
                                          .releaseDateAndRatingTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "rating ${trendingMovie![index]["vote_average"]}",
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
