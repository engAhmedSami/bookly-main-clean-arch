import 'package:bookly/Featuers/home/presentation/views/book_details_view.dart';
import 'package:bookly/Featuers/home/presentation/views/home_view.dart';
import 'package:bookly/Featuers/search/presentaition/viwes/search_view.dart';
import 'package:bookly/Featuers/splash/presentation/views/spalsh_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kBookDetailsView = '/bookdetailsview';
  static const kSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return const BookDetailsView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return const SearchView();
        },
      ),
    ],
  );
}
