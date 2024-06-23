import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/featured_books_list_view_bloc_builder.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/custom_app_bar.dart';
import 'package:bookly/Featuers/home/presentation/views/widget/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HowmViewBody extends StatelessWidget {
  const HowmViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CoustomAppBar(),
              ),
              FeaturedBookListViewBlocCunsumer(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListViewBlocBuilder(),
          ),
        )
      ],
    );
  }
}
