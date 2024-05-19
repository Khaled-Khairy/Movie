import 'package:flutter/material.dart';
import 'package:movie3/core/functions/extension.dart';
import 'package:movie3/features/home/presentation/views/widgets/search_widget.dart';

import '../../../../../core/colors.dart';
import 'carousel_widget.dart';
import 'movie_category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarouselWidget(),
            SizedBox(
              height: 10.h(context),
            ),
            SearchWidget(),
            SizedBox(
              height: 10.h(context),
            ),
            const MovieCategory(category: "popular", categoryName: "Popular"),
            SizedBox(
              height: 10.h(context),
            ),
            const MovieCategory(
                category: "now_playing", categoryName: "Now Playing"),
            SizedBox(
              height: 10.h(context),
            ),
            const MovieCategory(
                category: "top_rated", categoryName: "Top Rated"),
            SizedBox(
              height: 10.h(context),
            ),
            const MovieCategory(
                category: "upcoming", categoryName: "Up Coming"),
            SizedBox(
              height: 10.h(context),
            )
          ],
        ),
      ),
    );
  }
}
