import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_back/core/errors/failures.dart';
import 'package:flutter_back/core/utilities/api_service.dart';
import 'package:flutter_back/features/home/data/model/book_model/book_model.dart';
import 'package:flutter_back/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getData(
          path: 'Filtering=free-ebooks&q=programming');
      final bookModel = BookModel.fromJson(data);
      return right(bookModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          path: 'Filtering=free-ebooks&q=computer science');
      final bookModel = BookModel.fromJson(data);
      return right(bookModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.getData(
          path: 'Filtering=free-ebooks&q=$category');
      final bookModel = BookModel.fromJson(data);
      return right(bookModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSearchBooks(
      {required String category}) async {
    try {
      var data = await apiService.getData(
          path: 'Filtering=free-ebooks&q=$category');
      final bookModel = BookModel.fromJson(data);
      return right(bookModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
