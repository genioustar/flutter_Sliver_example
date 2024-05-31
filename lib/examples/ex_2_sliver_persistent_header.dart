import 'package:flutter/material.dart';

class SliverPersistentHeaderExample extends StatelessWidget {
  const SliverPersistentHeaderExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 100,
                (context, index) => ListTile(
                  title: Text('Item #$index'),
                ),
              ),
            ),
          ],
        ),
      );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blueGrey,
      child: const Center(
        child: Text(
          'SliverPersistentHeader',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
