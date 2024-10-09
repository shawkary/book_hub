import 'package:flutter_back/features/home/presentation/views/home_view.dart';
import 'package:flutter_back/features/search/presentation/views/search_view.dart';
import 'package:flutter_back/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/HomeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
