import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/home/components/input_search_home.dart';
import 'package:avoid_manga/ui/home/components/tab_view_home.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeViewModel = injector.get<HomeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: InputSearchHome(homeViewModel),
            automaticallyImplyLeading: false,
          ),
          bottomNavigationBar: const TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.star),
              ),
              Tab(
                icon: Icon(Icons.settings),
              )
            ],
          ),
          body: const SafeArea(
            child: TabBarViewHome(),
          ),
        ));
  }
}
