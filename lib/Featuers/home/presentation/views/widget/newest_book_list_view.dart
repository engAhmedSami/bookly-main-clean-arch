import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/newest_book_list_view_items.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: NewestBooksListViewItems(
              image: books[index].image ?? '',
              title: books[index].title,
              author: books[index].authorName ?? '',
              rate: books[index].rate ?? 0,
            ),
          );
        },
        itemCount: books.length);
  }
}
