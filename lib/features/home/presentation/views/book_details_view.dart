import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/service_locator.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:flutter_back/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_back/features/home/presentation/manager/similar_books_cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_details_view_widgets/book_details_view_body.dart';


class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => 
          SimilarBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchSimilarBooks(category: volumeInfo.categories?[0] ?? 'everything'),
      child: Scaffold(
        body: BookDetailsViewBody(
          volumeInfo: volumeInfo,
        ),
      ),
    );
  }
}
