// import 'package:flutter/material.dart';

// class CustomFadingWidget extends StatefulWidget {
//   const CustomFadingWidget({super.key, required this.child});
//   final Widget child;
//   @override
//   State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
// }

// class _CustomFadingWidgetState extends State<CustomFadingWidget>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation animation;

//   @override
//   void initState() {
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     animation =
//         Tween<double>(begin: 0.2, end: 0.8).animate(animationController);

//     animationController.addListener(
//       () {
//         setState(() {});
//       },
//     );
//     animationController.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(opacity: animation.value, child: widget.child);
//   }
// }
import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({super.key, required this.child});
  final Widget child;
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationController);

    animationController.addListener(
      () {
        setState(() {});
      },
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose the animationController properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: animation.value, child: widget.child);
  }
}
