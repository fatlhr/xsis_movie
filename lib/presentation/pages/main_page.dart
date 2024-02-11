import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xsis_movie/presentation/providers/movie/popular_provider.dart';

import '../component/image_horizontal_sliver_list.dart';
import '../providers/movie/now_playing_provider.dart';
import '../providers/movie/upcoming_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
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
            ImageHorizontalSliverList(
              height: size.height / 3,
              title: 'Popular',
              width: size.width / 3,
              asyncValue: ref.watch(popularProvider),
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
}
