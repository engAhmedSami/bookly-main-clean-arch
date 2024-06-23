import 'package:bookly/Core/utils/app_router.dart';
import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/Featuers/home/Domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Featuers/home/Domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/featch_newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Featuers/home/repo/home_repo_impl.dart';

import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewestBooks();
          },
        ),
        // BlocProvider(
        //   create: (context) {
        //     return SimilerBooksCubit(
        //       FetchSimilarBooksUseCase(
        //         getIt.get<HomeRepoImpl>(),
        //       ),
        //     )..fetchSimilarBooks();
        //   },
        // )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
