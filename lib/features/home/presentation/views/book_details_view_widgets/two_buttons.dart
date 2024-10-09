import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/shared_preference.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utilities/styles.dart';

class TwoButtons extends StatelessWidget {
  const TwoButtons({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            onPressed: () {
              if (everythingList.contains(volumeInfo.previewLink)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('This item is already in your cart')));
              } else {
                everythingList.addAll([
                  volumeInfo.imageLinks!.thumbnail!,
                  volumeInfo.title ?? 'undefined',
                  volumeInfo.authors?[0] ?? 'unknown',
                  volumeInfo.previewLink ?? 'https://example.com/404',
                ]);
                CacheHelper.saveList('everythingList', everythingList);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added successfully')));
              }
            },
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                borderSide: BorderSide.none),
            minWidth: (MediaQuery.sizeOf(context).width - 74) / 2,
            height: 50,
            color: Colors.white,
            child: Text('add to cart',
                style: Styles.textStyle16.copyWith(color: Colors.black)),
          ),
          MaterialButton(
            onPressed: () async {
              Uri uri = Uri.parse(
                  volumeInfo.previewLink ?? 'https://example.com/404');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                borderSide: BorderSide.none),
            minWidth: (MediaQuery.sizeOf(context).width - 74) / 2,
            height: 50,
            color: const Color(0xffEF8262),
            child: const Text('Preview'),
          )
        ],
      ),
    );
  }
}
