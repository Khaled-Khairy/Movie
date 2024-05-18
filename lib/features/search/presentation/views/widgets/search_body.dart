import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie3/features/search/presentation/views/widgets/search_card.dart';

import '../../manager/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.searchKey});

  final String searchKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      appBar: AppBar(
        title: Text(
          searchKey,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xfff1f1f1),
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0f0f0f),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xfff1f1f1),
            )),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xfff1f1f1),
              ),
            );
          } else if (state is SearchSuccess) {
            final movies = state.moviesList;
            if (movies.isNotEmpty) {
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification &&
                      notification.metrics.extentAfter == 0) {
                    SearchCubit cubit = BlocProvider.of(context);
                    cubit.fetchSearchMovies(searchKey);
                  }
                  return false;
                },
                child: SearchCard(
                  movies: movies,
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Nothing Found",
                  style: TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
                ),
              );
            }
          } else if (state is SearchFailed) {
            return const Center(
              child: Text(
                "Failed to Load Movies",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
              ),
            );
          } else {
            // Handle other states if needed
            return const Center(
              child: Text(
                "Unknown State",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }
}
