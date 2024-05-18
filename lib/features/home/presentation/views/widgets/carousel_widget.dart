import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/image_preview.dart';
import '../../../../../core/widgets/skelton.dart';
import '../../manager/movie_cubit.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..fetchTrendingMovies(),
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieSuccess) {
            return CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                final movie = state.moviesList[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "Details",
                        arguments: movie.id);
                  },
                  child: ImagePreview(
                    posterPath: movie.posterPath!,
                    title: movie.title!,
                    voteAverage: movie.voteAverage!,
                    isAdult: movie.adult!,
                    isHome: true,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.485,
              ),
            );
          } else if (state is MovieLoading) {
            return CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                return const Stack(
                  children: [
                    Skelton(
                      width: double.infinity,
                      height: double.infinity,
                      bRadius: 0,
                      baseColor: Color(0xff252525),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 50,
                      child: Skelton(
                        width: 200,
                        height: 25,
                        bRadius: 5,
                        baseColor: Color(0xff3f3f3f),
                      ),
                    ),
                    Positioned(
                        left: 5,
                        bottom: 5,
                        child: Skelton(
                          width: 85,
                          height: 35,
                          bRadius: 5,
                          baseColor: Color(0xff3f3f3f),
                        )),
                  ],
                );
              },
              options: CarouselOptions(
                enableInfiniteScroll: true,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.485,
              ),
            );
          } else if (state is MovieFailed) {
            return const Center(child: Text("Failed"));
          } else {
            return const Text("Unknown State");
          }
        },
      ),
    );
  }
}
