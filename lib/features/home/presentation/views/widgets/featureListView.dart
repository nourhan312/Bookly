import 'package:flutter/material.dart';

import 'listView_item.dart';

class FeatureListview extends StatelessWidget {
  const FeatureListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListviewItem(),
            ),
      ),
    );
  }
}
