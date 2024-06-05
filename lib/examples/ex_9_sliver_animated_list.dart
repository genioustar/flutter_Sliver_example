import 'package:flutter/material.dart';

// SliverAnimatedListExample 클래스는 StatefulWidget을 상속받아 정의합니다.
class SliverAnimatedListExample extends StatefulWidget {
  const SliverAnimatedListExample({super.key});

  // createState 메서드를 오버라이드하여 상태를 생성합니다.
  @override
  State<SliverAnimatedListExample> createState() =>
      _SliverAnimatedListExampleState();
}

// _SliverAnimatedListExampleState 클래스는 State<SliverAnimatedListExample>를 상속받아 정의합니다.
class _SliverAnimatedListExampleState extends State<SliverAnimatedListExample> {
  // SliverAnimatedList의 상태를 관리하기 위한 GlobalKey를 생성합니다.
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey();

  // 리스트 항목을 저장할 리스트를 생성합니다.
  List<int> items = [];

  // 아이템을 추가하는 함수입니다.
  void _addItem() {
    final int index = items.length;
    items.add(index);
    _listKey.currentState?.insertItem(index); // SliverAnimatedList에 아이템을 추가합니다.
  }

  // 아이템을 제거하는 함수입니다.
  void _removeItem(int index) {
    final int removedItem = items[index]; // 삭제할 항목을 저장합니다.
    items.removeAt(index); // 실제 리스트에서 항목을 제거합니다.
    _listKey.currentState?.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        return _buildItem(
            context, removedItem, animation); // 삭제된 항목에 애니메이션을 적용합니다.
      },
      duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간을 설정합니다.
    );
    setState(() {}); // 상태를 업데이트합니다.
  }

  // 항목을 빌드하는 함수입니다.
  Widget _buildItem(
      BuildContext context, int item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation, // 애니메이션을 사용하여 크기 변화를 설정합니다.
      child: Card(
        child: ListTile(
          title: Text('Item $item'), // 현재 항목의 텍스트를 표시합니다.
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                _removeItem(items.indexOf(item)), // 삭제 버튼을 누르면 항목을 제거합니다.
          ),
        ),
      ),
    );
  }

  // build 메서드를 오버라이드하여 위젯을 구성합니다.
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // AppBar 위젯을 사용하여 상단 앱 바를 만듭니다.
          title: const Text('SliverAnimatedList'),
        ),
        // CustomScrollView 위젯을 사용하여 스크롤 가능한 영역을 만듭니다.
        body: CustomScrollView(
          slivers: [
            // SliverAnimatedList 위젯을 사용하여 애니메이션 리스트를 만듭니다.
            SliverAnimatedList(
              key: _listKey, // 리스트의 키를 설정합니다.
              initialItemCount: items.length, // 초기 항목 개수를 설정합니다.
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return _buildItem(
                    context, items[index], animation); // 현재 항목을 빌드합니다.
              },
            ),
          ],
        ),
        // FloatingActionButton을 사용하여 항목을 추가할 수 있는 버튼을 만듭니다.
        floatingActionButton: FloatingActionButton(
          onPressed: _addItem, // 버튼을 누르면 항목을 추가합니다.
          child: const Icon(Icons.add),
        ),
      );
}
