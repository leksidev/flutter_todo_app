import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Segment> segments = [
      const Segment(
        value: 80,
        color: Colors.green,
        valueLabel: Text("готово"),
      ),
      const Segment(
        value: 14,
        color: Colors.yellow,
        valueLabel: Text("в процессе"),
      ),
      const Segment(
        value: 6,
        color: Colors.orange,
        valueLabel: Text("не готово"),
      ),
    ];
    final progressBar = PrimerProgressBar(
        segments: segments,
        barStyle: const SegmentedBarStyle(
          size: 4.0,
          gap: 1.0,
        ),
        legendStyle: const SegmentedBarLegendStyle(maxLines: 1),
        legendEllipsisBuilder: (truncatedItemCount) {
          final value = segments
              .skip(segments.length - truncatedItemCount)
              .fold(0, (accValue, segment) => accValue + segment.value);
          return LegendItem(
            segment: Segment(
              value: value,
              color: Colors.grey,
              label: const Text("Other"),
              valueLabel: Text("$value%"),
            ),
          );
        });

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 0.11,
                  offset: const Offset(0, 0),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Проект $index',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
              Text(
                'Описание проекта $index',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              progressBar,
            ],
          ),
        );
      },
    );
  }
}
