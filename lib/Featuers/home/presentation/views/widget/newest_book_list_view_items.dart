import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Featuers/home/presentation/views/book_details_view.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_book_image.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewItems extends StatelessWidget {
  const NewestBooksListViewItems({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.rate,
  });
  final String image;
  final String title;
  final String author;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(
        //   AppRouter.kBookDetailsView,
        // );
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookDetailsView(
            image: image,
            title: title,
            author: author,
          );
        }));
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              image: image,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(author,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14),
                  Row(
                    children: [
                      Text('Free',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      BookRating(
                        rate: rate,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
