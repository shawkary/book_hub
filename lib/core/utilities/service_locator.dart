import 'package:dio/dio.dart';
import 'package:flutter_back/core/utilities/api_service.dart';
import 'package:flutter_back/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

  final getIt = GetIt.instance;

  void setupServiceLocator() {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));
    getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  }
