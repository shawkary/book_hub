import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';


class BookDetailsBigImage extends StatelessWidget {
  const BookDetailsBigImage({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 1 / 1.6,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: volumeInfo.imageLinks?.thumbnail ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error)),
          ),
        ));
  }
}
