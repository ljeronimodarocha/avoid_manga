import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class InputSearchHome extends StatelessWidget {
  const InputSearchHome(this.homeViewModel, {super.key});

  final HomeViewmodel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Autocomplete<Manga>(
          initialValue: null,
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text.isEmpty) {
              return List<Manga>.empty();
            }
            await homeViewModel.findMangaComand.execute(textEditingValue.text);
            if (homeViewModel.findMangaComand.isSuccess) {
              var success =
                  homeViewModel.findMangaComand.value as SuccessCommand;
              return success.value as List<Manga>;
            }
            return List<Manga>.empty();
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
