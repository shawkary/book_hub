import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';

abstract class FeaturedBooksStates {}

class InitialFeaturedBooksState extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final BookModel bookModel;
  FeaturedBooksSuccess(this.bookModel);
}

class FeaturedBooksError extends FeaturedBooksStates {
  final String errMessage;
  FeaturedBooksError(this.errMessage);
}
