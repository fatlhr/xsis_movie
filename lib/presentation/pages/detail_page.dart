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
        children: [
          Text(
            data?.title ?? '',
          ),
          YoutubePlayerBuilderWidget(
            movieId: data?.id ?? 0,
            videoId: ref.watch(videoIdProvider),
          ),
        ],
      ),
    );
  }
}

final videoIdProvider = StateProvider<String>((ref) {
  return '';
});
