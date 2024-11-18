import 'package:flutter_back/features/home/data/repos/home_repo.dart';
import 'package:flutter_back/features/home/presentation/manager/newest_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.homeRepo) : super(InitialNewestBooksState());

  HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    var result = await homeRepo.fetchNewestBooks();

    result.fold(
      (failure) {
        emit(NewestBooksError(failure.errorMessage));
      },
      (bookModel) {
        emit(NewestBooksSuccess(bookModel));
      },
    );
  }
}