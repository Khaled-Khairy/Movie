import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search_cubit.dart';
import '../widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final String searchKey = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SearchCubit()..fetchSearchMovies(searchKey),
      child:  SearchBody(searchKey: searchKey,),
    );
  }
}
