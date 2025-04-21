import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/ui/chapter/modelview/chapter_modelview.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final chapterViewModel = injector.get<ChapterViewModel>();
  @override
  Widget build(BuildContext context) {
    var chapter = Routefly.of(context).query.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: chapter.baseUrl != null
            ? Center(
                child: Column(
                  children: [
                    ...?chapter.images?.map(
                      (image) => Image.network(
                        '${AppConstants.baseUrlUpload}data/${chapter.hashChapter}/$image',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error,
                              size: 50, color: Colors.red);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FilledButton(
                            onPressed: chapter.previous != null
                                ? () => chapterViewModel
                                    .goToChapterPage(chapter.previous!)
                                : null,
                            child: const Text("Previous"),
                          ),
                          FilledButton(
                            onPressed: chapter.next != null
                                ? () => chapterViewModel
                                    .goToChapterPage(chapter.next!)
                                : null,
                            child: const Text("Next"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
