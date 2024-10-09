import 'package:equatable/equatable.dart';
import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';
import 'package:flutter_back/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksError(failure.errorMessage));
      },
      (bookModel) {
        emit(SimilarBooksSuccess(bookModel));
      },
    );
  }
}
