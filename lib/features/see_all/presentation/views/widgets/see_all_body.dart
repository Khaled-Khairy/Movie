import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/colors.dart';
import '../../manager/sea_all_movies_cubit.dart';
import 'grid_card.dart';

class SeeAllBody extends StatelessWidget {
  final String category;
  final String categoryName;

  const SeeAllBody({super.key, required this.category, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          title: Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTextColor,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff0f0f0f),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: kTextColor,
              )),
        ),
        body: BlocBuilder<SeaAllMoviesCubit, SeeAllMoviesState>(
          builder: (context, state) {
            if (state is SeeAllMoviesSuccess) {
              return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      BlocProvider.of<SeaAllMoviesCubit>(context).fetchMovies(category);
                    }
                    return true;
                  },
                  child: GridCard(movies: state.moviesList));
            } else if (state is SeeAllMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xfff1f1f1),
                ),
              );
            } else if (state is SeeAllMoviesFailed) {
              return Center(
                  child: Text(
                "Failed to Load $category",
                style: const TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
              ));
            }
            return const Text("Unknown State");
          },
        ),
      ),
    );
  }
}
