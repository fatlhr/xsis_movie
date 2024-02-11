import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../providers/movie/movie_videos_provider.dart';
import 'async_value_widget.dart';

class YoutubePlayerBuilderWidget extends ConsumerStatefulWidget {
  const YoutubePlayerBuilderWidget({
    super.key,
    required this.movieId,
    required this.videoId,
  });
  final int movieId;
  final String videoId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YoutubePlayerBuilderWidgetState();
}

class _YoutubePlayerBuilderWidgetState
    extends ConsumerState<YoutubePlayerBuilderWidget> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      movieVideosProvider,
      (prev, next) {
        if (next is AsyncData && next.value != null) {
          _controller = YoutubePlayerController(
            initialVideoId:
                next.value?.where((e) => e.type == "Trailer").first.id ?? '',
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
            ),
          );
        }
      },
    );

    return AsyncValueWidget(
      value: ref.watch(movieVideosProvider),
      data: (data) {
        print(data.where((e) => e.type == "Trailer").first.id);
        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                player,
                const SizedBox(height: 20),
                Text(
                  data.where((e) => e.type == "Trailer").first.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
