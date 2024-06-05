import 'package:flutter/material.dart';

// SliverFixedExtendListExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverFixedExtentListExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverFixedExtentListExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        appBar: AppBar(
          // AppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
          title: const PreferredSize(
            // preferredSize를 사용하여 앱 바의 크기를 설정합니다.
            preferredSize: Size.fromHeight(100),
            // 앱 바의 제목을 설정합니다.
            child: Text('SliverFixedExtenedList'),
          ),
        ),
        // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
        body: CustomScrollView(
          // slivers 리스트에 슬리버 위젯들을 추가합니다.
          slivers: [
            // SliverFixedExtentList 위젯을 사용하여 고정된 크기의 리스트 항목을 만듭니다.
            SliverFixedExtentList(
                // SliverChildBuilderDelegate를 사용하여 자식 요소를 동적으로 만듭니다.
                delegate: SliverChildBuilderDelegate(
                  // 빌더 함수를 정의하여 각 리스트 항목을 구성합니다.
                  (context, index) => Container(
                    // 색상을 설정합니다. index를 사용하여 9가지 색상을 순환합니다.
                    color: Colors.deepPurple[100 * (index % 9)],
                    // ListTile 위젯을 사용하여 리스트 항목을 만듭니다.
                    child: ListTile(
                      // 항목의 제목을 'Item {index}'로 설정합니다.
                      title: Text('Item $index'),
                    ),
                  ),
                  // 자식 요소의 개수를 20개로 설정합니다.
                  childCount: 20,
                ),
                // 각 항목의 높이를 150으로 설정합니다.
                itemExtent: 150)
          ],
        ),
      );
}
