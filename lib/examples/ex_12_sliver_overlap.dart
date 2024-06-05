import 'package:flutter/material.dart';

// SliverOverlapExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverOverlapExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverOverlapExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => DefaultTabController(
        // DefaultTabController를 사용하여 탭을 관리합니다.
        length: 2, // 두 개의 탭을 정의합니다.
        child: Scaffold(
          // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
          appBar: AppBar(
            // AppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
            title: const Text('Sliver Overlap Example'), // 앱 바의 제목을 설정합니다.
            bottom: const TabBar(
              // TabBar 위젯을 사용하여 탭을 추가합니다.
              tabs: [
                Tab(text: 'Tab 1'), // 첫 번째 탭의 텍스트를 설정합니다.
                Tab(text: 'Tab 2'), // 두 번째 탭의 텍스트를 설정합니다.
              ],
            ),
          ),
          // NestedScrollView 위젯을 사용하여 중첩된 스크롤 영역을 만듭니다.
          body: NestedScrollView(
            // headerSliverBuilder를 사용하여 헤더 영역을 구성합니다.
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                // SliverOverlapAbsorber를 사용하여 중첩된 스크롤 뷰에서 중첩을 흡수합니다.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  // SliverAppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
                  title:
                      const Text('Sliver Overlap Absorber'), // 앱 바의 제목을 설정합니다.
                  pinned: true, // 스크롤 시 앱 바가 상단에 고정되도록 설정합니다.
                  expandedHeight: 200, // 앱 바의 확장된 높이를 설정합니다.
                  forceElevated: innerBoxIsScrolled, // 스크롤 시 그림자를 추가합니다.
                  flexibleSpace: FlexibleSpaceBar(
                    // FlexibleSpaceBar 위젯을 사용하여 확장 가능한 공간을 만듭니다.
                    background: Image.network(
                      // 네트워크 이미지를 배경으로 설정합니다.
                      'https://source.unsplash.com/random?sig=1',
                      fit: BoxFit.cover, // 이미지를 채우도록 설정합니다.
                    ),
                  ),
                ),
              ),
            ],
            // TabBarView를 사용하여 탭의 내용을 설정합니다.
            body: TabBarView(
              children: [
                buildTabView('Tab 1'), // 첫 번째 탭의 내용을 빌드합니다.
                buildTabView('Tab 2'), // 두 번째 탭의 내용을 빌드합니다.
              ],
            ),
          ),
        ),
      );

  // 탭의 내용을 빌드하는 함수입니다.
  Widget buildTabView(String text) => Builder(
        // Builder 위젯을 사용하여 컨텍스트를 생성합니다.
        builder: (context) => CustomScrollView(
          // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
          slivers: [
            SliverOverlapInjector(
              // SliverOverlapInjector를 사용하여 중첩된 스크롤 뷰의 중첩을 주입합니다.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              // SliverList 위젯을 사용하여 리스트를 만듭니다.
              delegate: SliverChildBuilderDelegate(
                // 리스트의 항목을 빌드합니다.
                (context, index) => ListTile(
                    title: Text('$text Item $index')), // 항목의 텍스트를 설정합니다.
                childCount: 20, // 리스트 항목의 개수를 설정합니다.
              ),
            ),
          ],
        ),
      );
}
