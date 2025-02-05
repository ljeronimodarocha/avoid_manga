import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final homeViewModel = injector.get<HomeViewmodel>();
  var currentPixel = 0.0;

  final ScrollController _scrollController = ScrollController();

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
      // Agendamos a rolagem após a reconstrução do widget
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
    return Scaffold(
      body: ListenableBuilder(
          listenable: homeViewModel.mangaComand,
          builder: (context, _) {
            if (homeViewModel.mangaComand.isSuccess) {
              return Align(
                  child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: homeViewModel.mangas.length,
                      prototypeItem: ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          homeViewModel.mangas.first.title,
                          selectionColor: Colors.black,
                        ),
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: Text(
                            textAlign: TextAlign.center,
                            homeViewModel.mangas[index].title,
                            selectionColor: Colors.black,
                          ),
                        );
                      }));
            } else if (homeViewModel.mangaComand.isRunning) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(child: FlutterLogo());
          }),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "",
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
