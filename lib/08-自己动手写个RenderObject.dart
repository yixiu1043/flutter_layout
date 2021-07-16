import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 布局原理
/// 向下传递约束，向上传递尺寸
void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自己动手写个RenderObject')),
      body: Container(
        color: Colors.yellow[200],
        // child: MyRenderBox(
        //   child: FlutterLogo(size: 200),
        // ),
        child: ShadowBox(
          distance: 4.0,
          child: Icon(Icons.category, size: 200),
        ),
      ),
    );
  }
}

// class MyRenderBox extends SingleChildRenderObjectWidget {
//   MyRenderBox({Widget child}) : super(child: child);
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderMyRenderBox();
//   }
// }
//
// /// 命名必须以Render开头
// class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
//   @override
//   void performLayout() {
//     /// demo01
//     // child.layout(constraints);
//     // size = Size(300, 300);
//     /// demo 02
//     // child.layout(BoxConstraints.tight(Size(50, 50)));
//     // size = Size(300, 300);
//     /// demo03
//     child.layout(constraints, parentUsesSize: true);
//     size = (child as RenderBox).size;
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     print(offset); // 试着注释掉appBar
//     context.paintChild(child, offset + Offset(20, 300),);
//     context.paintChild(child, offset + Offset(20, 150),);
//     // context.canvas.drawRect(rect, paint);
//
//     context.pushOpacity(offset, 127, (context, offset) {
//       context.paintChild(child, offset + Offset(0, 0),);
//     });
//   }
// }

/// 制作一个小demo，阴影盒子
class ShadowBox extends SingleChildRenderObjectWidget {
  final double distance;

  ShadowBox({Widget child, this.distance}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(distance);
  }

  /// 更新
  @override
  void updateRenderObject(
      BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject.distance = distance;
  }
}

/// 命名必须以Render开头
/// 方式一
// class RenderShadowBox extends RenderBox with RenderObjectWithChildMixin {
//   double distance;
//
//   RenderShadowBox(this.distance);
//
//   @override
//   void performLayout() {
//     child.layout(constraints, parentUsesSize: true);
//     size = (child as RenderBox).size;
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     context.paintChild(child, offset);
//     context.pushOpacity(offset, 127, (context, offset) {
//       context.paintChild(child, offset + Offset(distance, distance),);
//     });
//   }
// }

/// 方式二，RenderProxyBox比RenderObjectWithChildMixin更基础的
// class RenderShadowBox extends RenderProxyBox {
//   double distance;
//
//   RenderShadowBox(this.distance);
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     context.paintChild(child, offset);
//     context.pushOpacity(offset, 127, (context, offset) {
//       context.paintChild(child, offset + Offset(distance, distance),);
//     });
//   }
// }

/// 拓展，视图溢出的警戒线是怎么来的
class RenderShadowBox extends RenderProxyBox with DebugOverflowIndicatorMixin {
  double distance;

  RenderShadowBox(this.distance);

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child, offset);
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(
        child,
        offset + Offset(distance, distance),
      );
    });

    paintOverflowIndicator(
      context,
      offset,
      offset & size,
      offset & child.size,
      // Rect.fromLTWH(0, 0, size.width, size.height),
      // Rect.fromLTWH(0, 0, 520, 800),
    );
  }
}
