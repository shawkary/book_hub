import 'package:flutter/material.dart';
import 'package:flutter_back/constants.dart';
import 'package:flutter_back/core/utilities/components.dart';
import 'package:flutter_back/core/utilities/service_locator.dart';
import 'package:flutter_back/core/utilities/shared_preference.dart';
import 'package:flutter_back/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_back/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_back/features/home/presentation/manager/featured_books_cubit/cubit.dart';
import 'package:flutter_back/features/home/presentation/manager/newest_books_cubit/cubit.dart';
import 'package:flutter_back/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  everythingList = await CacheHelper.getList(key: 'everythingList') ?? [];

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: primaryColor),
        home: const SplashView(),
      ),
    );
  }
}
