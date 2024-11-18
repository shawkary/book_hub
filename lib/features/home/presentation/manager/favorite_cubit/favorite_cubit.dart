import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/shared_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(InitialFavorite());

  void addFavorite({
    required context,
    required String text0,
    required String text1,
    required String text2,
    required String text3,
    required String text4,
  }) {
    emit(LoadingFavoriteState());
    if (everythingList.contains(text0)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('This item is already in your favorites')));
      emit(ErrorFavoriteState());
    } else {
      everythingList.addAll([
        text1,
        text2,
        text3,
        text4,
      ]);
      CacheHelper.saveList('everythingList', everythingList);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1), content: Text('Added successfully')));
      emit(SuccessFavoriteState());
    }
  }

  void gg() {
    emit(LoadingFavoriteState());
    Future.delayed(
      const Duration(seconds: 1),
      () {
        emit(ReturnFromFavoriteState());
      },
    );
  }
}
