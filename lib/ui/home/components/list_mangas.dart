import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class ListMangasComponent extends StatefulWidget {
  final ScrollController scrollController;
  const ListMangasComponent({super.key, required this.scrollController});

  @override
  State<ListMangasComponent> createState() => _ListMangasComponentState();
}

class _ListMangasComponentState extends State<ListMangasComponent> {
  final homeViewModel = injector.get<HomeViewmodel>();
  var currentPixel = 0.0;

  Future<void> _scrollListener() async {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      currentPixel = widget.scrollController.position.pixels;
      homeViewModel.mangaComand.execute(homeViewModel.mangas.length + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.mangaComand.addListener(_listenable);
    homeViewModel.mangaComand.execute(0);
    widget.scrollController.addListener(_scrollListener);
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
        widget.scrollController.jumpTo(currentPixel);
      });
    }
  }

  @override
  void dispose() {
    homeViewModel.mangaComand.removeListener(_listenable);
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
                    controller: widget.scrollController,
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
