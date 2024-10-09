import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/service_locator.dart';
import 'package:flutter_back/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_back/features/search/fetch_search_cubit/cubit.dart';
import 'package:flutter_back/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchSearchCubit(getIt.get<HomeRepoImpl>()),
      child: const Scaffold(
          body: SafeArea(child: SearchViewBody()),
        ),
    );
  }
}
