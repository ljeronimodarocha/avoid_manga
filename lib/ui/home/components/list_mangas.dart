import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class ListMangasComponent extends StatefulWidget {
  const ListMangasComponent({super.key});

  @override
  State<ListMangasComponent> createState() => _ListMangasComponentState();
}

class _ListMangasComponentState extends State<ListMangasComponent> {
  final ScrollController _scrollController = ScrollController();
  final homeViewModel = injector.get<HomeViewmodel>();
  var currentPixel = 0.0;

  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      currentPixel = _scrollController.position.pixels;
      homeViewModel.mangaComand.execute(homeViewModel.mangas.length + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.mangaComand.addListener(_listenable);
    homeViewModel.mangaComand.execute(0);
    _scrollController.addListener(_scrollListener);
  }

  void _listenable() {
    if (homeViewModel.mangaComand.isFailure) {
      final error = homeViewModel.mangaComand.value as FailureCommand;
      final snackBar = SnackBar(
        content: Text("Erro ao buscar mangas ${error.error.toString()}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (homeViewModel.mangaComand.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(currentPixel);
      });
    }
  }

  @override
  void dispose() {
    homeViewModel.mangaComand.removeListener(_listenable);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListenableBuilder(
          listenable: homeViewModel.mangaComand,
          builder: (context, _) {
            if (homeViewModel.mangaComand.isSuccess &&
                homeViewModel.mangas.isNotEmpty) {
              return Align(
                alignment: Alignment.center,
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: homeViewModel.mangas.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeViewModel
                              .goToMangaPage(homeViewModel.mangas[index]);
                        },
                        child: ListTile(
                          style: ListTileStyle.list,
                          title: Text(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                            homeViewModel.mangas[index].title,
                            selectionColor: Colors.black,
                          ),
                        ),
                      );
                    }),
              );
            } else if (homeViewModel.mangaComand.isRunning) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(child: FlutterLogo());
          }),
    );
  }
}
