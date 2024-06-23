import 'package:bookly/Featuers/home/presentation/views/manager/featch_newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/featch_newest_books_cubit/newest_books_state.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/newest_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
