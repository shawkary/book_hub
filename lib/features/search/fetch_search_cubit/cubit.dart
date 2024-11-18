import 'package:equatable/equatable.dart';
import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';
import 'package:flutter_back/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';


class FetchSearchCubit extends Cubit<FetchSearchState> {
  FetchSearchCubit(this.homeRepo) : super(FetchSearchInitial());

  HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String category}) async {
    emit(FetchSearchLoading());
    var result = await homeRepo.fetchSearchBooks(category: category);

    result.fold(
      (failure) {
        emit(FetchSearchError(failure.errorMessage));
      },
      (bookModel) {
        emit(FetchSearchSuccess(bookModel));
      },
    );
  }
}
