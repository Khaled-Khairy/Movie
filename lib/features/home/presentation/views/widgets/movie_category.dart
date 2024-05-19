import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie3/features/home/presentation/views/widgets/skelton_list.dart';

import '../../../../../core/colors.dart';
import '../../manager/movie_cubit.dart';
import 'list_card.dart';

class MovieCategory extends StatelessWidget {
  final String category;
  final String categoryName;

  const MovieCategory(
      {super.key, required this.category, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        switch (categoryName) {
          case "Popular":
            return MovieCubit()..fetchPopularMovies();
          case "Top Rated":
            return MovieCubit()..fetchTopRatedMovies();
          case "Up Coming":
            return MovieCubit()..fetchUpComingMovies();
          case "Now Playing":
            return MovieCubit()..fetchNowPlayingMovies();
          default:
            return MovieCubit()..fetchPopularMovies();
        }
      },
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieSuccess) {
            final movies = state.moviesList;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryName,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.pushNamed(context, "SeeAll", arguments: {
                            "category": category,
                            "categoryName": categoryName,
                          });
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                              color: Color(0xff8D939C),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ListCard(movies: movies),
              ],
            );
          } else if (state is MovieLoading) {
            return SkeltonList(
              categoryTitle: categoryName,
            );
          } else if (state is MovieFailed) {
            return Center(child: Text("Failed to fetch $categoryName Movies"));
          } else {
            return const Text("Unknown State");
          }
        },
      ),
    );
  }
}
