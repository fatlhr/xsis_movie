import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/movie.dart';
import '../const/const.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.height,
    required this.width,
    required this.movie,
  });

  final double height;
  final double width;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: height * 0.8,
          ),
          child: CachedNetworkImage(
            width: width,
            imageUrl: '$photoURL${movie.posterPath}',
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
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(formatDate(movie.releaseDate)),
      ],
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat("dd MMM yyyy").format(dateTime);
    return formattedDate;
  }
}
