import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xsis_movie/presentation/component/async_value_widget.dart';
import 'package:xsis_movie/presentation/providers/movie/popular_provider.dart';

import '../component/image_horizontal_sliver_list.dart';
import '../const/const.dart';
import '../providers/movie/movie_search_provider.dart';
import '../providers/movie/now_playing_provider.dart';
import '../providers/movie/upcoming_provider.dart';
import 'movie_search_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton.filled(
                            onPressed: () {
                              ref.read(movieSearchProvider.notifier).getMovies(
                                    query: searchController.text,
                                  );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieSearchPage(
                                    query: searchController.text,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.search)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          // initialValue: '',
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Search",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: size.height / 3,
                width: double.infinity,
                child: AsyncValueWidget(
                  value: ref.watch(popularProvider),
                  data: (data) => CarouselSlider(
                    items: data
                        .asMap()
                        .entries
                        .map(
                          (e) => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black45,
                                  BlendMode.darken,
                                ),
                                image: NetworkImage(
                                  '$photoURL${e.value.posterPath}',
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.value.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  formatDate(e.value.releaseDate),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 0,
                    ),
                  ),
                ),
              ),
            ),
            ImageHorizontalSliverList(
              height: size.height / 3,
              title: 'Up Coming',
              width: size.width / 3,
              asyncValue: ref.watch(upcomingProvider),
            ),
            ImageHorizontalSliverList(
              height: size.height / 3,
              title: 'Now Playing',
              width: size.width / 3,
              asyncValue: ref.watch(nowPlayingProvider),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat("dd MMM yyyy").format(dateTime);
    return formattedDate;
  }
}
