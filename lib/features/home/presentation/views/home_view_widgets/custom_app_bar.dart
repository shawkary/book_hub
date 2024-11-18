import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/assets.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/features/search/presentation/views/search_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, width: 80),
          const Spacer(),
          GestureDetector(
            onTap: () {
              navigateTo(context, const SearchView());
            },
            child: const Icon(Icons.search, size: 30),
          )
        ],
      ),
    );
  }
}
