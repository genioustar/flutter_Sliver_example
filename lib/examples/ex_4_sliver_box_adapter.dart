import 'package:flutter/material.dart';

class SliverToBoxAdapterExample extends StatelessWidget {
  const SliverToBoxAdapterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              height: 150,
              child: const Text('SliverToBoxAdapter'),
            ),
          ),
          SliverList(
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
        ],
      ),
    );
  }
}
