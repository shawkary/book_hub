import 'package:flutter/material.dart';
import 'package:flutter_back/core/errors/custom_error_widget.dart';
import 'package:flutter_back/features/home/presentation/manager/newest_books_cubit/cubit.dart';
import 'package:flutter_back/features/home/presentation/manager/newest_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_list_view_item.dart';


class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NewestBooksListViewItem(
                  volumeInfo: state.bookModel.items![index].volumeInfo,
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: state.bookModel.items!.length,
            ),
          );
        } else if (state is NewestBooksError) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
