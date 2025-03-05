import 'package:bookly/features/home/presentation/views/widgets/bestSellerItem.dart';
import 'package:flutter/material.dart';

class BestsellerListview extends StatelessWidget {
  const BestsellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const BestsellerItem(),
          );
        });
  }
}
