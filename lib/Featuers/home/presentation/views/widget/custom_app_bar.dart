import 'package:bookly/Core/utils/app_router.dart';
import 'package:bookly/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 16),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 20,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              )),
        ],
      ),
    );
  }
}
