import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/styles.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view_widgets/book_details_big_image.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view_widgets/similar_list_view.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view_widgets/two_buttons.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/newest_list_view_item.dart';
import 'book_details_app_bar.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BookDetailsAppBar(),
          const SizedBox(height: 40),
          BookDetailsBigImage(
            volumeInfo: volumeInfo,
          ),
          const SizedBox(height: 20),
          Text(
            volumeInfo.title ?? 'Undefined',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.textStyle30),
          const SizedBox(height: 5),
          Text(
            volumeInfo.authors?[0] ?? 'Unknown',
              style: Styles.textStyle16
                  .copyWith(color: Colors.grey, fontStyle: FontStyle.italic)),
          const SizedBox(height: 15),
          BookRating(
            pageCount: volumeInfo.pageCount ?? 0,
          ),
          const SizedBox(height: 30),
          TwoButtons(volumeInfo: volumeInfo),
          const SizedBox(height: 40),
          const Row(
            children: [
              Text('   You can also like', style: Styles.textStyle14),
            ],
          ),
          const SizedBox(height: 15),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}
