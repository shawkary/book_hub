import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';

abstract class NewestBooksStates {}

class InitialNewestBooksState extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksSuccess extends NewestBooksStates {
  final BookModel bookModel;
  NewestBooksSuccess(this.bookModel);
}

class NewestBooksError extends NewestBooksStates {
  final String errMessage;
  NewestBooksError(this.errMessage);
}