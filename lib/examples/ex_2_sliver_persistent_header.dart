import 'package:flutter/material.dart';

// SliverPersistentHeaderExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverPersistentHeaderExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverPersistentHeaderExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        body: CustomScrollView(
          // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
          slivers: [
            // SliverPersistentHeader 위젯을 사용하여 고정 헤더를 만듭니다.
            SliverPersistentHeader(
              // MySliverPersistentHeaderDelegate를 사용하여 헤더의 내용을 정의합니다.
              delegate: MySliverPersistentHeaderDelegate(),
              // floating이 true일 경우, 스크롤이 빠르게 될 때 헤더가 화면 상단에 고정됩니다.
              floating: true,
              // pinned가 true일 경우, 헤더가 스크롤될 때 항상 화면 상단에 고정됩니다.
              pinned: true,
            ),
            // SliverList 위젯을 사용하여 리스트를 만듭니다.
            SliverList(
              // SliverChildBuilderDelegate를 사용하여 자식 요소를 동적으로 만듭니다.
              delegate: SliverChildBuilderDelegate(
                // 자식 요소의 개수를 100개로 설정합니다.
                childCount: 100,
                // 빌더 함수를 정의하여 각 리스트 항목을 구성합니다.
                (context, index) => ListTile(
                  // 항목의 제목을 'Item #{index}'로 설정합니다.
                  title: Text('Item #$index'),
                ),
              ),
            ),
          ],
        ),
      );
}

// MySliverPersistentHeaderDelegate 클래스를 SliverPersistentHeaderDelegate를 상속받아 정의합니다.
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  // build 메서드를 오버라이드하여 헤더의 위젯을 구성합니다.
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 컨테이너를 생성하여 배경색을 설정하고, 중앙에 텍스트를 배치합니다.
    return Container(
      color: Colors.blueGrey,
      child: const Center(
        // 헤더의 텍스트를 설정합니다.
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

  // 헤더의 최대 높이를 반환합니다.
  @override
  double get maxExtent => 150;

  // 헤더의 최소 높이를 반환합니다.
  @override
  double get minExtent => 60;

  // 헤더가 다시 빌드되어야 하는지 여부를 결정합니다. 여기서는 false로 설정하여 빌드를 재실행하지 않습니다.
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
