import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie3/core/functions/extension.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/widgets/image_preview.dart';
import '../../../data/models/movie_details_model.dart';

class DetailsInfo extends StatelessWidget {
  final MovieDetailsModel movie;
  final String formattedReleaseDate;

  const DetailsInfo(
      {super.key, required this.movie, required this.formattedReleaseDate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagePreview(
            posterPath: movie.posterPath!,
            title: movie.title!,
            voteAverage: movie.voteAverage!,
            isAdult: movie.adult!,
            isHome: false,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: movie.genres!.map((genre) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: kSkeltonColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          genre,
                          style: const TextStyle(
                              color: Color(0xfff1f1f1), fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 5.h(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.clock_bold,
                          color: kTextColor,
                        ),
                        SizedBox(
                          width: 5.w(context),
                        ),
                        Text("${movie.runtime!.toString()} Minutes",
                            style: TextStyle(color: kTextColor, fontSize: 16))
                      ],
                    ),
                    Text(formattedReleaseDate,
                        style: TextStyle(color: kTextColor, fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5.h(context),
                ),
                movie.tagline!.isNotEmpty
                    ? Text(movie.tagline!,
                        style: TextStyle(color: kTextColor, fontSize: 16))
                    : Container(
                        color: Colors.transparent,
                      ),
                SizedBox(
                  height: 5.h(context),
                ),
                ReadMoreText(
                  movie.overview!,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8D939C)),
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
