import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/books_action.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDitalesSection extends StatelessWidget {
  const BookDitalesSection({
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
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 5),
          child: CustomBookImage(
            image: image!,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle30,
            textAlign: TextAlign.center),
        Opacity(
          opacity: 0.7,
          child: Text(author!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(
          height: 15,
        ),
        const BookRating(
          rate: 4.9,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksAction(),
      ],
    );
  }
}
