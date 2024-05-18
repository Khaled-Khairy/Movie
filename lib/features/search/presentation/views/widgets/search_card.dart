import 'package:flutter/material.dart';
import 'package:movie3/core/functions/extension.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/widgets/my_image.dart';
import '../../../data/models/search_model.dart';


class SearchCard extends StatelessWidget {
  final List<SearchModel> movies;

  const SearchCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Column(
          children: [
            SizedBox(
              width: 180.w(context),
              height: 240.h(context),
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(context, "Details", arguments: movie.id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MyImage(image: movie.posterPath!, widthCache: 180*2, heightCache: 240*2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style:  TextStyle(
                      color: kTextColor,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 3.w(context),
                      ),
                      Text(
                        movie.voteAverage!.toStringAsFixed(1),
                        style:  TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
      itemCount: movies.length,
    );
  }
}
