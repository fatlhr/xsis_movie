import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xsis_movie/presentation/providers/movie/upcoming_provider.dart';

import '../misc/async_value_widget.dart';
import '../providers/movie/movie_videos_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: AsyncValueWidget(
            value: ref.watch(upcomingProvider),
            data: (data) => Column(
              children: [
                ...data
                    .map(
                      (movie) => Text(movie.title),
                    )
                    .toList(),
                const Text("text"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    ref
                        .read(movieVideosProvider.notifier)
                        .getVideos(id: 866398);
                  },
                  child: const Text("detail"),
                ),
                AsyncValueWidget(
                  value: ref.watch(movieVideosProvider),
                  data: (data) => Text(
                    data.map((e) => e.name).toList().toString(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
