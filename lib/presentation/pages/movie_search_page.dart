import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xsis_movie/presentation/component/async_value_widget.dart';
import 'package:xsis_movie/presentation/providers/movie/movie_search_provider.dart';

import '../const/const.dart';

class MovieSearchPage extends ConsumerWidget {
  const MovieSearchPage({
    super.key,
    // required this.movies,
    required this.query,
  });
  // final List<Movie> movies;
  final String query;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(query),
        actions: const [],
      ),
      body: AsyncValueWidget(
        value: ref.watch(movieSearchProvider),
        data: (data) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              print('date: ${data[index].releaseDate}');
              return Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      // width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: '$photoURL${data[index].posterPath}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        color: Colors.grey,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    data[index].title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    data[index].releaseDate.isNotEmpty
                        ? formatDate(data[index].releaseDate)
                        : "no date",
                    style: const TextStyle(
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
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
