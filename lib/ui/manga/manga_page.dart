import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key});

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  @override
  Widget build(BuildContext context) {
    var manga = Routefly.of(context).query.arguments;
    manga = Manga.fromJsonCustom(manga);
    final String coverUrl =
        '${AppConstants.baseUrlUpload}covers/${manga.id}/${manga.fileName}';

    @override
    void initState() {
      precacheImage(NetworkImage(coverUrl), context);
      super.initState();
    }

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
                Image.network(
                  '${AppConstants.baseUrlUpload}covers/${manga.id}/${manga.fileName}',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Retorna a imagem carregada
                    }
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Mostra loading enquanto carrega
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Descrição",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  manga.description ?? '',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
