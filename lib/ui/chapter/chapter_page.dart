import 'package:avoid_manga/domain/entities/chapter_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    var chapter = Routefly.of(context).query.arguments;
    var newChapter = Chapter.fromJson(chapter);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: newChapter.baseUrl != null
            ? Center(
              child: Column(
                  children: newChapter.images
                          ?.map(
                            (image) => Image.network(
                                '${AppConstants.baseUrlUpload}data/${newChapter.hashChapter}/$image'),
                          )
                          .toList() ??
                      [],
                ),
            )
            : null,
      ),
    );
  }
}
