import 'package:bookly/Featuers/home/presentation/views/manager/fetch_similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_similer_books_cubit/similer_books_state.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/book_ditales_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDitalesSectionBlocBuilder extends StatelessWidget {
  const BookDitalesSectionBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
      builder: (context, state) {
        if (state is SimilerBooksSuccess) {
          return const BookDitalesSection();
        } else if (state is SimilerBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
