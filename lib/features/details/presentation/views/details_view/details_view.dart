import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/movie_details_cubit.dart';
import '../widgets/details_body.dart';


class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => DetailsCubit()..fetchMovieDetails(id),
      child: const DetailsBody(),
    );
  }
}
