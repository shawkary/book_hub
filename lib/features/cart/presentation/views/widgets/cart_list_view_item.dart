import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/styles.dart';
import 'package:flutter_back/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter_back/features/cart/presentation/views/widgets/dialog_content.dart';
import 'package:url_launcher/url_launcher.dart';


class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.index, required this.cubit});
  final int index;
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri uri = Uri.parse(everythingList[index * 4 + 3]);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
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
                  imageUrl: everythingList[index * 4],
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
                      everythingList[index * 4 + 1],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20,
                    ),
                    Text(
                      everythingList[index * 4 + 2],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => DialogContent(index: index, cubit: cubit),
                  );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
