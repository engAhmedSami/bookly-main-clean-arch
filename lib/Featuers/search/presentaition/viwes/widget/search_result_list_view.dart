import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Search Result',
              ));
        },
        itemCount: 10);
  }
}
