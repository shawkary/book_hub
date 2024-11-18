import 'package:flutter/material.dart';
import 'package:flutter_back/core/errors/custom_error_widget.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/newest_list_view_item.dart';
import 'package:flutter_back/features/search/fetch_search_cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchCubit, FetchSearchState>(
      builder: (BuildContext context, state) {
        if (state is FetchSearchSuccess) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return NewestBooksListViewItem(volumeInfo: state.bookModel.items![index].volumeInfo);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemCount: state.bookModel.items?.length ?? 0,
              ),
            ),
          );
        }else if(state is FetchSearchError){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const Center(child: Text(''));
        }
      },
    );
  }
}