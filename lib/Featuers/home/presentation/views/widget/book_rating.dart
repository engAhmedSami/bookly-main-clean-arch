import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rate,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 18,
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text('4.5', style: Styles.textStyle16),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text('250',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
