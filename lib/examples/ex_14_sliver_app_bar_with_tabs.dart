/// SliverAppBar와 TabBar를 결합한 예제입니다.
/// DefaultTabController를 사용하여 탭을 관리하고,
/// NestedScrollView를 사용하여 중첩된 스크롤 뷰를 만듭니다.
/// SliverAppBar는 상단에 위치하며, TabBar를 포함하여 세 개의 탭을 정의합니다.
/// 각 탭은 TabBarView를 통해 고유의 콘텐츠를 표시합니다.
/// 각 탭의 내용은 Center 위젯을 사용하여 중앙에 텍스트를 배치합니다.
library;

import 'package:flutter/material.dart';

// SliverAppBarWithTabsExample 클래스를 StatelessWidget을 상속받아 정의합니다.
class SliverAppBarWithTabsExample extends StatelessWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const SliverAppBarWithTabsExample({super.key});

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => DefaultTabController(
        // DefaultTabController를 사용하여 탭을 관리합니다.
        length: 3, // 세 개의 탭을 정의합니다.
        child: Scaffold(
          // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
          body: NestedScrollView(
            // NestedScrollView 위젯을 사용하여 중첩된 스크롤 영역을 만듭니다.
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              // SliverAppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
              const SliverAppBar(
                title: Text('SliverAppBar with Tabs'), // 앱 바의 제목을 설정합니다.
                bottom: TabBar(
                  // TabBar 위젯을 사용하여 탭을 추가합니다.
                  tabs: [
                    Tab(
                      icon: Icon(Icons.info), // 첫 번째 탭의 아이콘을 설정합니다.
                      text: 'tab 1', // 첫 번째 탭의 텍스트를 설정합니다.
                    ),
                    Tab(
                      icon:
                          Icon(Icons.lightbulb_outline), // 두 번째 탭의 아이콘을 설정합니다.
                      text: 'tab 2', // 두 번째 탭의 텍스트를 설정합니다.
                    ),
                    Tab(
                      icon: Icon(Icons.settings), // 세 번째 탭의 아이콘을 설정합니다.
                      text: 'tab 3', // 세 번째 탭의 텍스트를 설정합니다.
                    ),
                  ],
                ),
              ),
            ],
            // TabBarView를 사용하여 탭의 내용을 설정합니다.
            body: const TabBarView(
              // 각 탭의 내용을 정의합니다.
              children: [
                Center(child: Text('Tab 1')), // 첫 번째 탭의 내용을 설정합니다.
                Center(child: Text('Tab 2')), // 두 번째 탭의 내용을 설정합니다.
                Center(child: Text('Tab 3')), // 세 번째 탭의 내용을 설정합니다.
              ],
            ),
          ),
        ),
      );
}
