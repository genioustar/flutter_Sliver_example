import 'package:flutter/material.dart';

// SliverGridCountExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverGridCountExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverGridCountExample({super.key});

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
            child: Text('SliverGrid.count'),
          ),
        ),
        // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
        body: CustomScrollView(
          // slivers 리스트에 슬리버 위젯들을 추가합니다.
          slivers: [
            // SliverGrid.count 위젯을 사용하여 그리드를 만듭니다.
            SliverGrid.count(
              // crossAxisCount를 사용하여 한 행에 4개의 항목을 배치합니다.
              crossAxisCount: 4,
              // List.generate를 사용하여 20개의 항목을 생성합니다.
              children: List.generate(
                20,
                // 각 항목을 컨테이너로 정의합니다.
                (index) => Container(
                  // 색상을 설정합니다. index를 사용하여 9가지 색상을 순환합니다.
                  color: Colors.deepPurple[100 * (index % 9)],
                  // ListTile 위젯을 사용하여 리스트 항목을 만듭니다.
                  child: ListTile(
                    // 항목의 제목을 'Item {index}'로 설정합니다.
                    title: Text('Item $index'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
