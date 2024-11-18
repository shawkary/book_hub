part of 'cubit.dart';

sealed class FetchSearchState extends Equatable {
  const FetchSearchState();

  @override
  List<Object> get props => [];
}

final class FetchSearchInitial extends FetchSearchState {}

final class FetchSearchLoading extends FetchSearchState {}

final class FetchSearchSuccess extends FetchSearchState {
  final BookModel bookModel;

  const FetchSearchSuccess(this.bookModel);
}

final class FetchSearchError extends FetchSearchState {
  final String errMessage;

  const FetchSearchError(this.errMessage);
}
