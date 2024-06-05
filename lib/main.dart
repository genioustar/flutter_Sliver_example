import 'package:flutter/material.dart';

import 'examples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SliverExampleNavigatorList(),
    );
  }
}

final List<Map<String, dynamic>> _example = [
  {
    'title': 'SliverAppBar',
    'widget': const SliverAppBarExample(),
  },
  {
    'title': 'SliverPersistentHeader',
    'widget': const SliverPersistentHeaderExample(),
  },
  {
    'title': 'SliverPadding',
    'widget': const SliverPaddingExample(),
  },
  {
    'title': 'SliverToBoxAdapter',
    'widget': const SliverToBoxAdapterExample(),
  },
  {
    'title': 'SliverGrid',
    'widget': const SliverGridExample(),
  },
  {
    'title': 'SliverFixedExtentList',
    'widget': const SliverFixedExtentListExample(),
  },
  {
    'title': 'SliverGrid.count',
    'widget': const SliverGridCountExample(),
  },
  {
    'title': 'SliverGrid.extent',
    'widget': const SliverGridExtentExample(),
  },
  {
    'title': 'SliverAnimatedList',
    'widget': const SliverAnimatedListExample(),
  },
  {
    'title': 'SliverFillRemaining',
    'widget': const SliverFillRemainingExample(),
  },
  {
    'title': 'SliverFillViewport',
    'widget': const SliverFillViewportExample(),
  },
  {
    'title': 'Sliver Overlap',
    'widget': const SliverOverlapExample(),
  },
  {
    'title': 'Sliver Grid Mix',
    'widget': const SliverGridMixExample(),
  },
  {
    'title': 'SliverAppBarWithTabs',
    'widget': const SliverAppBarWithTabsExample(),
  },
  {
    'title': 'RefreshSliverListExample',
    'widget': const RefreshSliverListExample(),
  }
];

class SliverExampleNavigatorList extends StatelessWidget {
  const SliverExampleNavigatorList({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Text(
              'sliver examples',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          itemCount: _example.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(_example[index]['title']),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _example[index]['widget']),
            ),
          ),
        ),
      );
}
