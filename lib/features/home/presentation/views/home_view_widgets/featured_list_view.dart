import 'package:flutter/material.dart';
import 'package:flutter_back/core/errors/custom_error_widget.dart';
import 'package:flutter_back/features/home/presentation/manager/featured_books_cubit/cubit.dart';
import 'package:flutter_back/features/home/presentation/manager/featured_books_cubit/states.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/featured_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
        builder: (BuildContext context, state) {
      if (state is FeaturedBooksSuccess) {
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return FeaturedBooksListViewItem(
                  volumeInfo: state.bookModel.items![index].volumeInfo,
                  );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.bookModel.items!.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        );
      } else if (state is FeaturedBooksError) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
