import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';

class InputSearchHome extends StatelessWidget {
  const InputSearchHome(this.homeViewModel, {super.key});

  final HomeViewmodel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Autocomplete<Manga>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<Manga>.empty();
            }
            return homeViewModel.foundMangas.where((Manga manga) {
              return manga.title
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          displayStringForOption: (Manga manga) => manga.title,
          onSelected: (Manga manga) {
            homeViewModel.goToMangaPage(manga);
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onChanged: (value) {
                homeViewModel.findMangaComand.execute(value);
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar manga...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
