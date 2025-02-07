import 'package:avoid_manga/ui/home/components/list_mangas.dart';
import 'package:flutter/material.dart';

class TabBarViewHome extends StatelessWidget {
  const TabBarViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ListMangasComponent(),
        Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Config',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
