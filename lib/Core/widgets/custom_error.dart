import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMassage});
  final String errMassage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMassage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
