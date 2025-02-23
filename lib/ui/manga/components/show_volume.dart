import 'package:avoid_manga/domain/entities/volume_entity.dart';
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

  void _toggleChapters() {
    setState(() {
      _showChapters = !_showChapters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _toggleChapters,
            child: ListTile(
              style: ListTileStyle.list,
              title: Text(
                widget.volume.numero.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (_showChapters)
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.volume.chapters.length,
              itemBuilder: (BuildContext context, index) {
                final chapter = widget.volume.chapters[index];
                return ListTile(
                  title: Text(
                    chapter.numero,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
