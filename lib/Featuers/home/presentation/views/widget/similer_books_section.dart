import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilerBooksSection extends StatelessWidget {
  const SimilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You May Also Like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
