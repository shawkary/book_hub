import 'package:flutter/material.dart';
import 'package:flutter_back/features/search/fetch_search_cubit/cubit.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.cubit});
  final FetchSearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        onChanged: (value) {
          if(value != '') cubit.fetchSearchBooks(category: value);
        },
        decoration: InputDecoration(
          hintText: 'search',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: .8,
              child: Icon(Icons.search),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
