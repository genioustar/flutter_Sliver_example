import 'package:flutter/material.dart';

class SliverFillRemainingExample extends StatelessWidget {
  const SliverFillRemainingExample({super.key});

  // 이 위젯은 Scaffold의 전체 본문 콘텐츠를 구축합니다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverFillRemaining'), // AppBar 제목 설정
      ),
      body: CustomScrollView(
        // 여러 슬리버를 사용하여 스크롤 가능한 영역을 만듭니다.
        slivers: [
          // 첫 번째 Sliver는 amber 색상과 텍스트가 있는 고정된 높이의 컨테이너를 표시합니다.
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center, // 컨테이너 내부에 자식 위젯을 중앙 정렬합니다.
              height: 150, // 컨테이너 높이 설정
              color: Colors.amber, // 컨테이너 배경색 설정
              child: const Text('SliverToBoxAdapter'), // 컨테이너 내에 텍스트 표시
            ),
          ),
          // 두 번째 Sliver는 스크롤 가능한 영역의 나머지 공간을 채웁니다.
          SliverFillRemaining(
            child: Container(
              color: Colors.blueGrey, // 컨테이너 배경색 설정
              alignment: Alignment.center, // 컨테이너 내부에 자식 위젯을 중앙 정렬합니다.
              child: const Text(
                'SliverFillRemaining', // 컨테이너 내에 텍스트 표시
                style: TextStyle(
                  color: Colors.white, // 텍스트 색상을 흰색으로 설정
                  fontSize: 24, // 텍스트 크기 설정
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
