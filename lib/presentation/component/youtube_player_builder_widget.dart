import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../providers/movie/movie_videos_provider.dart';
import 'async_value_widget.dart';

class YoutubePlayerBuilderWidget extends ConsumerStatefulWidget {
  const YoutubePlayerBuilderWidget({
    super.key,
    required this.videoId,
  });
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
      // initialVideoId: YoutubePlayer.convertUrlToId(
      //         'https://www.youtube.com/watch?v=${widget.videoId}') ??
      //     '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget(
      value: ref.watch(movieVideosProvider),
      data: (data) {
        print('movie id: ${data.where((e) => e.type == "Trailer").first.key}');
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    data.where((e) => e.type == "Trailer").first.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
