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

class _ShowVolumeState extends State<ShowVolume> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        children: [
          ExpansionTile(
            expandedAlignment: Alignment.center,
            title: Text(
              "Volume ${widget.volume.numero}",
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            children: widget.volume.chapters.map((chapter) {
              return ListTile(
                title: Text(
                  "Capítulo ${chapter.numero}",
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
