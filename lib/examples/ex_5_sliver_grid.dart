import 'package:flutter/material.dart';

// SliverGrid 예제의 StatelessWidget 정의
class SliverGridExample extends StatelessWidget {
  const SliverGridExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        // 상단에 AppBar 추가
        appBar: AppBar(
          title: const Text('SliverGrid'), // AppBar의 제목 설정
        ),
        // CustomScrollView를 사용하여 다양한 Sliver 위젯들을 포함한 스크롤 가능한 영역 생성
        body: CustomScrollView(
          slivers: [
            // SliverGrid를 사용하여 스크롤 가능한 그리드 생성
            SliverGrid(
              // SliverChildBuilderDelegate를 사용하여 그리드 항목을 동적으로 생성
              delegate: SliverChildBuilderDelegate(
                // 그리드 항목의 총 개수 설정
                childCount: 20,
                // 빌더 함수: 각 그리드 항목의 인덱스에 따라 컨테이너를 생성
                (context, index) => Container(
                  alignment: Alignment.center, // 컨테이너 내의 텍스트를 중앙에 정렬
                  color: Colors.teal[100 * (index % 9)], // 인덱스에 따라 색상 변경
                  child: Text('Grid Item $index'), // 그리드 항목의 텍스트 설정
                ),
              ),
              // 그리드 레이아웃을 설정하는 gridDelegate
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 그리드의 열 개수 설정
                crossAxisSpacing: 10, // 그리드 항목 간의 가로 간격 설정
                mainAxisSpacing: 10, // 그리드 항목 간의 세로 간격 설정
                childAspectRatio: 2.0, // 그리드 항목의 가로 대 세로 비율 설정
              ),
            ),
          ],
        ),
      );
}
