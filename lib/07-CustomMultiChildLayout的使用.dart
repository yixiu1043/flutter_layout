import 'package:flutter/material.dart';

/// 布局原理
/// 向下传递约束，向上传递尺寸
void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomMultiChildLayout')),
      /// CustomMultiChildLayout 是占满全屏幕的
      body: Container(
        color: Colors.red[200],
        child: CustomMultiChildLayout(
          delegate: MyDelegate(thickness: 2),
          children: [
            LayoutId(
              id: 1,
              child: FlutterLogo(
                size: 120,
              ),
            ),

            /// 以下为做一个下划线效果
            LayoutId(
              id: 'underline',
              child: Container(
                color: Colors.red,
              ),
            ),
            LayoutId(
              id: 'text',
              child: Text(
                'YIXIU',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 委托
class MyDelegate extends MultiChildLayoutDelegate {
  final double thickness;

  MyDelegate({this.thickness = 8.0});

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    // return super.getSize(constraints);
    return Size(300, 300);
  }

  @override
  void performLayout(Size size) {
    // TODO: implement performLayout
    var size1, size2, size3;
    if (hasChild(1)) {
      size1 = layoutChild(
          1,

          /// 紧约束1
          // BoxConstraints(
          //   minHeight: 100,
          //   minWidth: 100,
          //   maxHeight: 100,
          //   maxWidth: 100,
          // ),
          /// 紧约束2 ， 与紧约束1相同
          // BoxConstraints.tight(Size(100, 100))
          BoxConstraints.loose(size) // 0 - 375 的约束，此时改变logo的大小是生效的
          );
      positionChild(1, Offset(0, 0));
    }

    size2 = layoutChild('text', BoxConstraints.loose(size));
    layoutChild('underline', BoxConstraints.tight(Size(size2.width, thickness)));

    final left = (size.width - size2.width) / 2;
    final top = (size.width - size2.height) / 2;

    positionChild('text', Offset(left, top));
    positionChild('underline', Offset(left, top + size2.height));
  }

  @override
  // 默认优化用的
  // bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
  bool shouldRelayout(_) {
    // TODO: implement shouldRelayout
    throw UnimplementedError();
  }
}
