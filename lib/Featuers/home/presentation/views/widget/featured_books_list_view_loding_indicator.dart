import 'package:bookly/Core/widgets/custom_fading_widget.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_book_image_loding_indicator.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLodingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLodingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLodingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
