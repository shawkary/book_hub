import 'package:flutter/material.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/shared_preference.dart';
import 'package:flutter_back/features/home/data/repos/home_repo.dart';
import 'package:flutter_back/features/home/presentation/manager/featured_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.homeRepo) : super(InitialFeaturedBooksState());

  HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failure) {
        emit(FeaturedBooksError(failure.errorMessage));
      },
      (bookModel) {
        emit(FeaturedBooksSuccess(bookModel));
      },
    );
  }
}
