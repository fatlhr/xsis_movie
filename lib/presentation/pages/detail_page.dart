import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/async_value_widget.dart';
import '../component/youtube_player_builder_widget.dart';
import '../providers/movie/movie_detail_provider.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(movieDetailProvider(id: id)),
      data: (data) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayerBuilderWidget(
            videoId: ref.watch(videoIdProvider),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  data?.title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 18),
                Wrap(
                  children: data?.genres
                          ?.map(
                            (e) => Text(
                              data.genres != null ? '${e.name ?? ''}, ' : '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                          .toList() ??
                      [],
                ),
                const SizedBox(height: 16),
                Text(
                  data?.overview ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final videoIdProvider = StateProvider<String>((ref) {
  return '';
});
