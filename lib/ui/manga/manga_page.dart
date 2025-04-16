import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:avoid_manga/ui/manga/components/show_volume.dart';
import 'package:avoid_manga/ui/manga/viewmodels/manga_viewmodel.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key});

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  late Manga manga;
  late List<Volume> volumes;
  final mangaViewModel = injector.get<MangaViewmodel>();
  late String coverUrl;

  @override
  void initState() {
    super.initState();
    mangaViewModel.volumesComand.addListener(_listenable);
    mangaViewModel.isFollowMangaCommand.addListener(__listenableFavorite);
  }

  @override
  void dispose() {
    mangaViewModel.volumesComand.removeListener(_listenable);
    mangaViewModel.isFollowMangaCommand.removeListener(__listenableFavorite);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mangaData = Routefly.of(context).query.arguments;
    manga = Manga.fromJsonCustom(mangaData);
    coverUrl =
        '${AppConstants.baseUrlUpload}covers/${manga.id}/${manga.fileName}';

    precacheImage(NetworkImage(coverUrl), context);

    mangaViewModel.volumesComand.execute(manga.id);
    mangaViewModel.isFollowMangaCommand.execute(manga.id);
  }

  void __listenableFavorite() {
    if (mangaViewModel.isFollowMangaCommand.isSuccess) {
      var success = mangaViewModel.isFollowMangaCommand.value as SuccessCommand;

      manga = Manga.isFollow(manga, success.value as bool);
    }
  }

  void _listenable() {
    if (mangaViewModel.volumesComand.isFailure) {
      final error = mangaViewModel.volumesComand.value as FailureCommand;
      final snackBar = SnackBar(
        content: Text("Erro ao buscar volumes ${error.error.toString()}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(manga.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(coverUrl),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    const Text(
                      "Descrição",
                      style: TextStyle(fontSize: 20),
                    ),
                    ListenableBuilder(
                      listenable: mangaViewModel.isFollowMangaCommand,
                      builder: (context, child) {
                        return IconButton(
                          onPressed: () {},
                          icon: Icon(
                            manga.isFollow == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 30,
                          ),
                        );
                      },
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  manga.description ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Volumes",
                  style: TextStyle(fontSize: 20),
                ),
                ListenableBuilder(
                  listenable: mangaViewModel.volumesComand,
                  builder: (context, child) {
                    if (mangaViewModel.volumesComand.isSuccess &&
                        mangaViewModel.volumes.isNotEmpty) {
                      return AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Column(
                          children: mangaViewModel.volumes
                              .map((volume) => ShowVolume(volume: volume))
                              .toList(),
                        ),
                      );
                    } else if (mangaViewModel.volumesComand.isRunning) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(child: FlutterLogo());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
