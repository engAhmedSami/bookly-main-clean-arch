import 'package:bookly/Featuers/home/presentation/views/widget/book_ditales_section_bloc_builder.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/similer_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDitalesSectionBlocBuilder(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilerBooksSection(),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
