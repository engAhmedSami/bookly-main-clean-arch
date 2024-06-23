import 'package:flutter/material.dart';

class CustomBookImageLodingIndicator extends StatelessWidget {
  const CustomBookImageLodingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.grey.shade300,
            )),
      ),
    );
  }
}
