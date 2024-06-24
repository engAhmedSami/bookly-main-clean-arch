import 'package:bookly/Featuers/home/presentation/views/widget/book_ditales_section.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/similer_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    this.image,
    this.title,
    this.author,
  });
  final String? image;
  final String? title;
  final String? author;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDitalesSection(
                  image: image,
                  title: title,
                  author: author,
                ),
                // BookDitalesSectionBlocBuilder(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilerBooksSection(),
                const SizedBox(
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
