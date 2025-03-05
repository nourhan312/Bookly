import 'package:bookly/features/home/presentation/views/widgets/listView_item.dart';
import 'package:flutter/material.dart';

class MostLikeSection extends StatelessWidget {
  const MostLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListviewItem(),
        ),
      ),
    );
  }
}
