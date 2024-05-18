import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../manager/movie_details_cubit.dart';
import 'details_info.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0f0f0f),
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsSuccess) {
              final movie = state.movieDetails;
              String formattedReleaseDate = movie.releaseDate!.isNotEmpty
                  ? DateFormat('d MMMM y')
                      .format(DateTime.parse(movie.releaseDate!))
                  : "Coming Soon";
              return DetailsInfo(
                movie: movie,
                formattedReleaseDate: formattedReleaseDate,
              );
            } else if (state is DetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xfff1f1f1)),
              );
            } else if (state is DetailsFailed) {
              return const Center(
                  child: Text(
                "Failed to Load Movies",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
              ));
            } else {
              return const Text("UnKnown State");
            }
          },
        ),
      ),
    );
  }
}
