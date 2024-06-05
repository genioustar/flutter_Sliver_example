import 'package:flutter/material.dart';

// SliverGridExtentExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverGridExtentExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverGridExtentExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        appBar: AppBar(
          // AppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
          title: const Text('SliverGrid.extent'),
        ),
        // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
        body: CustomScrollView(
          // slivers 리스트에 슬리버 위젯들을 추가합니다.
          slivers: [
            // SliverGrid.extent 위젯을 사용하여 그리드를 만듭니다.
            SliverGrid.extent(
              // maxCrossAxisExtent를 사용하여 항목의 최대 너비를 200으로 설정합니다.
              maxCrossAxisExtent: 200,
              // crossAxisSpacing을 사용하여 항목 간의 수평 간격을 10으로 설정합니다.
              crossAxisSpacing: 10,
              // mainAxisSpacing을 사용하여 항목 간의 수직 간격을 10으로 설정합니다.
              mainAxisSpacing: 10,
              // childAspectRatio를 사용하여 항목의 가로 세로 비율을 2:3으로 설정합니다.
              childAspectRatio: 2 / 3,
              // List.generate를 사용하여 20개의 항목을 생성합니다.
              children: List.generate(
                20,
                // 각 항목을 컨테이너로 정의합니다.
                (index) => Container(
                  // 색상을 설정합니다. index를 사용하여 9가지 색상을 순환합니다.
                  color: Colors.deepPurple[100 * (index % 9)],
                  child: Text('Item $index'),
                ),
              ),
            ),
          ],
        ),
      );
}
