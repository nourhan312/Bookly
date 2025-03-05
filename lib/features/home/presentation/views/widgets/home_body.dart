import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestSellerItem.dart';
import 'package:bookly/features/home/presentation/views/widgets/featureListView.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(),
                FeatureListview(),
                const SizedBox(height: 20),
                Text(
                  'Best Sellers',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: const BestsellerItem(),
            ),
            childCount: 10,
          ),
        )
      ],
    );
  }
}
