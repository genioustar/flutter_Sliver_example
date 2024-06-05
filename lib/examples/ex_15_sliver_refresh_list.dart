import 'package:flutter/material.dart';

// RefreshSliverListExample 클래스를 StatefulWidget을 상속받아 정의합니다.
class RefreshSliverListExample extends StatefulWidget {
  // const 생성자를 사용하여 불변 위젯임을 표시합니다.
  const RefreshSliverListExample({super.key});

  // 상태를 생성하는 createState 메서드를 오버라이드합니다.
  @override
  State<RefreshSliverListExample> createState() =>
      _RefreshSliverListExampleState();
}

// _RefreshSliverListExampleState 클래스를 정의하여 상태를 관리합니다.
class _RefreshSliverListExampleState extends State<RefreshSliverListExample> {
  // _refresh 메서드를 정의하여 리스트를 새로고침할 때 호출됩니다.
  Future<void> _refresh() async {
    // 2초 동안 지연을 주어 새로고침 동작을 모방합니다.
    await Future.delayed(const Duration(seconds: 2));
  }

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        // Scaffold 위젯을 사용하여 기본적인 앱 구조를 만듭니다.
        body: RefreshIndicator(
          // RefreshIndicator 위젯을 사용하여 당겨서 새로고침 기능을 추가합니다.
          onRefresh: _refresh, // 새로고침할 때 호출될 콜백 함수를 지정합니다.
          child: CustomScrollView(
            // CustomScrollView를 사용하여 스크롤 가능한 영역을 만듭니다.
            slivers: [
              // SliverAppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
              const SliverAppBar(
                title: Text('Refresh SliverList'), // 앱 바의 제목을 설정합니다.
                floating: true, // 스크롤 시 앱 바가 떠 있는 상태로 유지됩니다.
                snap: true, // 스크롤이 멈출 때 앱 바가 자동으로 나타나도록 합니다.
              ),
              // SliverList 위젯을 사용하여 리스트를 만듭니다.
              SliverList(
                // SliverChildBuilderDelegate를 사용하여 리스트의 항목을 빌드합니다.
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: Text('Item $index'), // 항목의 텍스트를 설정합니다.
                  ),
                  childCount: 20, // 리스트 항목의 개수를 설정합니다.
                ),
              ),
            ],
          ),
        ),
      );
}
