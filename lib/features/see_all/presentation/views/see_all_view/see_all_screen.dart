import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/sea_all_movies_cubit.dart';
import '../widgets/see_all_body.dart';


class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return BlocProvider(
      create: (context) => SeaAllMoviesCubit()..fetchMovies(args["category"]),
      child: SeeAllBody(category: args["category"], categoryName:args["categoryName"] ),
    );
  }
}

