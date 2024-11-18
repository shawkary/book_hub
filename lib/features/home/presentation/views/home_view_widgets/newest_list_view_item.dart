import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view.dart';
import '../../../../../core/utilities/styles.dart';


class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, BookDetailsView(volumeInfo: volumeInfo,));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .14,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1 / 1.6,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: volumeInfo.imageLinks?.thumbnail ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      volumeInfo.title??'',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20,
                    ),
                    Text(
                      volumeInfo.authors?[0] ?? 'Unknown',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text('Free',
                            style: Styles.textStyle18
                                .copyWith(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        BookRating(
                          pageCount: volumeInfo.pageCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.pageCount});
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4F)),
        const SizedBox(width: 3),
        const Text('4.8', style: Styles.textStyle16),
        const SizedBox(width: 10),
        Text('pages ($pageCount)',
            style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
