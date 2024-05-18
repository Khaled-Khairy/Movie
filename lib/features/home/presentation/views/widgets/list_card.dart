import "package:flutter/material.dart";
import "package:movie3/core/functions/extension.dart";

import "../../../../../core/colors.dart";
import "../../../../../core/widgets/my_image.dart";
import "../../../data/models/home_models.dart";

class ListCard extends StatelessWidget {
  final List<HomeMoviesModel> movies;

  const ListCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 290.h(context),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  width: 160.w(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.pushNamed(context, "Details",
                              arguments: movie.id);
                        },
                        child: SizedBox(
                          width: 180.w(context),
                          height: 240.h(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MyImage(image: movie.posterPath!,widthCache: 180*2,heightCache: 240*2,),
                          ),
                        ),
                      ),
                      Column(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}