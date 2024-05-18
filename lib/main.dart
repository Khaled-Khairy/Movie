import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/details/presentation/views/details_view/details_view.dart';
import 'features/home/presentation/views/home_view/home_screen.dart';
import 'features/search/presentation/views/search_view/search_view.dart';
import 'features/see_all/presentation/views/see_all_view/see_all_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "SeeAll": (context) => const SeeAllScreen(),
        "Details": (context) => const DetailsView(),
        "Search": (context) => const SearchView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}
