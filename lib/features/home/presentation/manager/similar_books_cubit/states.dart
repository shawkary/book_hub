part of 'cubit.dart';

sealed class SimilarBooksStates extends Equatable {
  const SimilarBooksStates();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksStates {}

final class SimilarBooksLoading extends SimilarBooksStates {}
final class SimilarBooksSuccess extends SimilarBooksStates {
  final BookModel bookModel;
  const SimilarBooksSuccess(this.bookModel);
}

final class SimilarBooksError extends SimilarBooksStates {
  final String errMessage;
  const SimilarBooksError(this.errMessage);
}

final class SuccessAddToFavorite extends SimilarBooksStates {}
final class ErrorAddToFavorite extends SimilarBooksStates {}
