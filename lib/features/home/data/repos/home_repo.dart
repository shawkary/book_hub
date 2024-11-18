import 'package:dartz/dartz.dart';
import 'package:flutter_back/core/errors/failures.dart';
import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetchFeaturedBooks();
  Future<Either<Failure, BookModel>> fetchNewestBooks();
  Future<Either<Failure, BookModel>> fetchSimilarBooks({required String category});
  Future<Either<Failure, BookModel>> fetchSearchBooks({required String category});
}
