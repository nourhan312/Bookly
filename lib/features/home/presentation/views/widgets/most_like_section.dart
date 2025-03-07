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
          child: ListviewItem(
              imageUrl:
                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1rlNr7.img?w=768&h=513&m=6&x=426&y=117&s=140&d=140'),
        ),
      ),
    );
  }
}
