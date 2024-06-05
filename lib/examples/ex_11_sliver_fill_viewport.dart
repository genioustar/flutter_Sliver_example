import 'package:flutter/material.dart';

class SliverFillViewportExample extends StatelessWidget {
  const SliverFillViewportExample({super.key});

  // 이 위젯은 전체 Scaffold 화면의 본문 내용을 구축합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('SliverFillViewport'), // AppBar 제목 설정
        ),
        body: CustomScrollView(
          slivers: [
            // 첫 번째 Sliver는 고정된 높이 (150)의 amber 색상을 가진 컨테이너와 Text를 표시합니다.
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center, // 컨테이너 내부에 자식 위젯을 가운데 정렬합니다.
                height: 150, // 컨테이너 높이 설정
                color: Colors.amber, // 컨테이너 배경색 설정
                child: const Text('SliverToBoxAdapter'), // 컨테이너 내에 Text 표시
              ),
            ),
            // 두 번째 Sliver는 스크롤 가능한 영역의 절반 (viewportFraction: 0.5)을 채우며 양쪽 끝 부분 패딩 (padEnds: false) 을 추가하지 않습니다.
            SliverFillViewport(
              padEnds: false,
              viewportFraction: 0.5,
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) => Container(
                  color: Colors.deepPurple[100 * (index % 9)],
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
