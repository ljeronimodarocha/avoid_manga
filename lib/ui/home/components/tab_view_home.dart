import 'package:avoid_manga/ui/home/components/list_mangas.dart';
import 'package:avoid_manga/ui/home/components/list_mangas_favorited.dart';
import 'package:flutter/material.dart';

class TabBarViewHome extends StatefulWidget {
  const TabBarViewHome({super.key});

  @override
  State<TabBarViewHome> createState() => _TabBarViewHomeState();
}

class _TabBarViewHomeState extends State<TabBarViewHome> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListMangasComponent(scrollController: _scrollController1),
        ListMangasFavoritedComponent(
          scrollController: _scrollController2,
        ),
        const Text(
          'Config',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
