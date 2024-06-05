import 'package:flutter/material.dart';

// SliverGridMixExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverGridMixExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverGridMixExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        body: CustomScrollView(
          // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
          slivers: [
            // SliverAppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
            const SliverAppBar(
              backgroundColor: Colors.blue, // 앱 바의 배경 색상을 설정합니다.
              expandedHeight: 150, // 앱 바의 확장된 높이를 설정합니다.
              flexibleSpace: FlexibleSpaceBar(
                // FlexibleSpaceBar 위젯을 사용하여 확장 가능한 공간을 만듭니다.
                title: Text('SliverGridMixExample'), // 앱 바의 제목을 설정합니다.
                background: Image(
                  // 네트워크 이미지를 배경으로 설정합니다.
                  image:
                      NetworkImage('https://source.unsplash.com/random?sig=1'),
                  fit: BoxFit.cover, // 이미지를 채우도록 설정합니다.
                ),
              ),
            ),
            // SliverGrid 위젯을 사용하여 그리드를 만듭니다.
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                // 그리드의 항목을 빌드합니다.
                childCount: 20, // 그리드 항목의 개수를 설정합니다.
                (context, index) => Container(
                  color: Colors
                      .deepPurple[100 * (index % 9)], // 그리드 항목의 배경 색상을 설정합니다.
                  child: Text(
                    'Grid Item $index', // 그리드 항목의 텍스트를 설정합니다.
                  ),
                ),
              ),
              // 고정된 열 개수로 그리드를 배치하는 gridDelegate를 설정합니다.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3), // 한 줄에 3개의 항목을 배치합니다.
            ),
            // SliverList 위젯을 사용하여 리스트를 만듭니다.
            SliverList(
              delegate: SliverChildBuilderDelegate(
                // 리스트의 항목을 빌드합니다.
                (context, index) =>
                    ListTile(title: Text('Item $index')), // 리스트 항목의 텍스트를 설정합니다.
                childCount: 20, // 리스트 항목의 개수를 설정합니다.
              ),
            ),
          ],
        ),
      );
}
