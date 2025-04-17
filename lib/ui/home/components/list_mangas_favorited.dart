import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class ListMangasFavoritedComponent extends StatefulWidget {
  final ScrollController scrollController;
  const ListMangasFavoritedComponent(
      {super.key, required this.scrollController});

  @override
  State<ListMangasFavoritedComponent> createState() =>
      _ListMangasComponentState();
}

class _ListMangasComponentState extends State<ListMangasFavoritedComponent> {
  final homeViewModel = injector.get<HomeViewmodel>();
  var currentPixel = 0.0;

  Future<void> _scrollListener() async {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      currentPixel = widget.scrollController.position.pixels;
      homeViewModel.mangaFavoritedComand
          .execute(homeViewModel.mangasFavotited.length + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.mangaFavoritedComand.addListener(_listenable);
    homeViewModel.mangaFavoritedComand.execute(0);
    widget.scrollController.addListener(_scrollListener);
  }

  void _listenable() {
    if (homeViewModel.mangaFavoritedComand.isFailure) {
      final error = homeViewModel.mangaFavoritedComand.value as FailureCommand;
      final snackBar = SnackBar(
        content: Text("Erro ao buscar mangas ${error.error.toString()}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (homeViewModel.mangaFavoritedComand.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.scrollController.jumpTo(currentPixel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListenableBuilder(
          listenable: homeViewModel.mangaFavoritedComand,
          builder: (context, _) {
            if (homeViewModel.mangaFavoritedComand.isSuccess &&
                homeViewModel.mangasFavotited.isNotEmpty) {
              return Align(
                alignment: Alignment.center,
                child: ListView.builder(
                    controller: widget.scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: homeViewModel.mangasFavotited.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeViewModel.goToMangaPage(
                              homeViewModel.mangasFavotited[index]);
                        },
                        child: ListTile(
                          style: ListTileStyle.list,
                          title: Text(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                            homeViewModel.mangasFavotited[index].title,
                            selectionColor: Colors.black,
                          ),
                        ),
                      );
                    }),
              );
            } else if (homeViewModel.mangaFavoritedComand.isRunning) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(child: FlutterLogo());
          }),
    );
  }
}
