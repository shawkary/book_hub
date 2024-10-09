import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:flutter_back/features/home/presentation/views/book_details_view.dart';


class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, BookDetailsView(volumeInfo: volumeInfo));
      },
      child: ClipRRect(
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
    );
  }
}
