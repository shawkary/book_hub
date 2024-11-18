import 'package:flutter/material.dart';
import 'package:flutter_back/features/search/fetch_search_cubit/cubit.dart';
import 'package:flutter_back/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter_back/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchSearchCubit, FetchSearchState>(
        builder: (BuildContext context, FetchSearchState state) {
          return Column(
            children: [
              SearchTextField(cubit: BlocProvider.of(context)),
              const SizedBox(height: 15),
              if (state is FetchSearchSuccess)
              const SearchListView(),
          ],
        );
      }, listener: (BuildContext context, FetchSearchState state) {  },
    );
  }
}
