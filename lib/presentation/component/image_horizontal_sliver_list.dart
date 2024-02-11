import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xsis_movie/presentation/providers/movie/movie_videos_provider.dart';

import '../../domain/entities/movie.dart';
import '../pages/detail_page.dart';
import 'async_value_sliver_widget.dart';
import 'movie_card.dart';

class ImageHorizontalSliverList extends ConsumerWidget {
  const ImageHorizontalSliverList({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.asyncValue,
  });

  final double height;
  final double width;
  final String title;
  final AsyncValue<List<Movie>> asyncValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      movieVideosProvider,
      (prev, next) {
        if (next is AsyncData && next.value != null) {
          ref.read(videoIdProvider.notifier).state =
              next.value?.where((e) => e.type == "Trailer").first.key ?? '';
        }
      },
    );
    return AsyncValueSliverWidget(
      value: asyncValue,
      data: (data) => SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 12.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: data[index] == data.first ? 24 : 10,
                    right: data[index] == data.last ? 24 : 0,
                  ),
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(movieVideosProvider.notifier)
                          .getVideos(id: data[index].id);
                      movieDetailModal(context, data[index]);
                    },
                    child: SizedBox(
                      width: width,
                      child: MovieCard(
                        height: height,
                        width: width,
                        movie: data[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> movieDetailModal(BuildContext context, Movie movie) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              trailing: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ),
            DetailPage(id: movie.id),
          ],
        ),
      ),
    );
  }
}
