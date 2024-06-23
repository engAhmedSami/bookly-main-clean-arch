import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Featuers/search/presentaition/viwes/widget/custom_search_text_filed.dart';
import 'package:bookly/Featuers/search/presentaition/viwes/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomSearchTextField(),
          SizedBox(height: 20),
          Text('Search Result ', style: Styles.textStyle18),
          SizedBox(height: 20),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
