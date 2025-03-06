import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:avoid_manga/ui/chapter/modelview/chapter_modelview.dart';
import 'package:flutter/material.dart';

class ShowVolume extends StatefulWidget {
  const ShowVolume({
    super.key,
    required this.volume,
  });

  final Volume volume;

  @override
  State<ShowVolume> createState() => _ShowVolumeState();
}

class _ShowVolumeState extends State<ShowVolume> {
  bool _showChapters = false;

  final chapterViewModel = injector.get<ChapterViewModel>();

  void _toggleChapters() {
    setState(() {
      _showChapters = !_showChapters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _toggleChapters,
          child: ListTile(
            style: ListTileStyle.list,
            title: Text(
              'Volume ${widget.volume.numero.toString()}',
              style: const TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        AnimatedSize(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          child: _showChapters
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.volume.chapters.length,
                    itemBuilder: (BuildContext context, index) {
                      final chapter = widget.volume.chapters[index];
                      return GestureDetector(
                        onTap: () {
                          chapterViewModel.goToChapterPage(chapter);
                        },
                        child: ListTile(
                          title: Text(
                            'Capítulo ${chapter.numero}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
