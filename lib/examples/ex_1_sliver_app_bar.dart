import 'package:flutter/material.dart';

// SliverAppBarExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverAppBarExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverAppBarExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        body: CustomScrollView(
          // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
          slivers: [
            // SliverAppBar 위젯을 사용하여 앱 바를 만듭니다.
            SliverAppBar(
              // 확장된 높이를 200.0으로 설정합니다.
              expandedHeight: 200.0,
              // floating이 false일 경우, 스크롤이 빠르게 될 때 앱 바가 사라집니다.
              floating: false,
              // pinned가 true일 경우, 앱 바가 스크롤될 때 항상 화면 상단에 고정됩니다.
              pinned: true,
              // FlexibleSpaceBar를 사용하여 유연한 공간을 만듭니다.
              flexibleSpace: FlexibleSpaceBar(
                // 앱 바의 제목을 설정합니다.
                title: const Text(
                  'SliverAppBar',
                  // 텍스트 스타일을 설정합니다.
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                ),
                // 배경 이미지를 설정합니다.
                background: Image.network(
                  'https://picsum.photos/250?image=9',
                  // 이미지를 커버 모드로 설정하여 전체 배경을 채웁니다.
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SliverList 위젯을 사용하여 리스트를 만듭니다.
            SliverList(
              // SliverChildBuilderDelegate를 사용하여 자식 요소를 동적으로 만듭니다.
              delegate: SliverChildBuilderDelegate(
                // 빌더 함수를 정의하여 각 리스트 항목을 구성합니다.
                (context, index) => ListTile(
                  // 항목의 제목을 'Item #{index}'로 설정합니다.
                  title: Text('Item #$index'),
                ),
                // 자식 요소의 개수를 100개로 설정합니다.
                childCount: 100,
              ),
            ),
          ],
        ),
      );
}
