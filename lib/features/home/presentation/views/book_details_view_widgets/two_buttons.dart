import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/home/data/model/book_model/volume_info.dart';
import 'package:flutter_back/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';


class TwoButtons extends StatelessWidget {
  const TwoButtons({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        FavoriteCubit cubit = BlocProvider.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  cubit.addFavorite(
                      context: context,
                      text0: volumeInfo.previewLink!,
                      text1: volumeInfo.imageLinks!.thumbnail!,
                      text2: volumeInfo.title ?? 'undefined',
                      text3: volumeInfo.authors?[0] ?? 'unknown',
                      text4: volumeInfo.previewLink ?? 'https://example.com/404',
                      );
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
                child: Icon(
                  Icons.favorite,
                  size: 40,
                  color: everythingList.contains(volumeInfo.previewLink)
                      ? Colors.red
                      : Colors.grey,
                ),
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
      },
    );
  }
}
