import 'package:flutter/material.dart';

// SliverToBoxAdapter 예제의 StatelessWidget 정의
class SliverToBoxAdapterExample extends StatelessWidget {
  const SliverToBoxAdapterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯을 사용하여 기본적인 화면 구조 설정
      body: CustomScrollView(
        // CustomScrollView를 사용하여 다양한 Sliver 위젯들을 포함한 스크롤 가능한 영역 생성
        slivers: [
          // SliverToBoxAdapter를 사용하여 일반 위젯을 Sliver 위젯으로 변환
          SliverToBoxAdapter(
            child: Container(
              // 배경색을 노란색으로 설정
              color: Colors.amber,
              // 컨테이너 내의 텍스트를 중앙에 정렬
              alignment: Alignment.center,
              // 컨테이너의 높이를 150으로 설정
              height: 150,
              // 컨테이너 내에 텍스트 추가
              child: const Text('SliverToBoxAdapter'),
            ),
          ),
          // SliverList를 사용하여 스크롤 가능한 리스트 생성
          SliverList(
            // SliverChildBuilderDelegate를 사용하여 리스트 항목을 동적으로 생성
            delegate: SliverChildBuilderDelegate(
              // 빌더 함수: 각 리스트 항목의 인덱스에 따라 컨테이너를 생성
              (context, index) => Container(
                // 인덱스에 따라 색상 변경
                color: Colors.deepPurple[100 * (index % 9)],
                // 리스트 항목을 나타내는 ListTile 위젯 추가
                child: ListTile(
                  title: Text('Item $index'), // 리스트 항목의 제목 텍스트 설정
                ),
              ),
              // 리스트 항목의 총 개수 설정
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
