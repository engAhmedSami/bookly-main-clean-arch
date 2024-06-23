import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_featured_books_cubit/featured_books_state.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/featur_books_list_view.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/featured_books_list_view_loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBlocCunsumer extends StatefulWidget {
  const FeaturedBookListViewBlocCunsumer({
    super.key,
  });

  @override
  State<FeaturedBookListViewBlocCunsumer> createState() =>
      _FeaturedBookListViewBlocCunsumerState();
}

class _FeaturedBookListViewBlocCunsumerState
    extends State<FeaturedBookListViewBlocCunsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
          setState(() {});
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedBooksListViewLodingIndicator();
        }
      },
    );
  }
}
