import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/core/errors/custom_error_widget.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/home/presentation/manager/similar_books_cubit/cubit.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 120,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateTo(context, BookDetailsView(volumeInfo: state.bookModel.items![index].volumeInfo));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                          aspectRatio: 1 / 1.6,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: state.bookModel.items![index].volumeInfo.imageLinks?.thumbnail! ?? '',
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
                          )),
                    ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.bookModel.items!.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilarBooksError) {
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
