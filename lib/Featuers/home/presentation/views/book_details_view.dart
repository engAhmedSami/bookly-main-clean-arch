import 'package:bookly/Featuers/home/presentation/views/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, this.image, this.title, this.author});
  final String? image;
  final String? title;
  final String? author;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        image: image,
        title: title,
        author: author,
      )),
    );
  }
}
