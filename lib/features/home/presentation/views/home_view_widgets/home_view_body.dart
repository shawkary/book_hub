import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/styles.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/custom_app_bar.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/featured_list_view.dart';
import 'package:flutter_back/features/home/presentation/views/home_view_widgets/newest_list_view.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 50),
          Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Newest Books', style: Styles.textStyle18)),
          SizedBox(height: 20),
          NewestListView(),
        ],
      ),
    );
  }
}
