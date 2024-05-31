import 'package:flutter/material.dart';

class SliverPaddingExample extends StatelessWidget {
  const SliverPaddingExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(80),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    color: Colors.deepPurple[100 * (index % 9)],
                    child: ListTile(
                      title: Text('Item $index'),
                    ),
                  ),
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      );
}
