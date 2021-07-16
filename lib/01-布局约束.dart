import 'package:flutter/material.dart';

/// 布局约束
/// 默认占满整个屏幕
void main() {
  /// demo 01
  /// 尽管设置给logo设置了100的大小，但是当调整container的大小时，logo跟着变化了
  // runApp(Container(
  //   // width: 200,
  //   // height: 200,
  //   width: 300,
  //   height: 300,
  //   color: Colors.orange,
  //   child: FlutterLogo(size: 100),
  // ));

  /// demo 02
  /// 是500x500的黑色包裹300x300的橘黄色吗？
  /// 结果：整个屏幕都是橘黄色的，思考一下怎么回事
  /// 当把橘黄色的container注释之后整个屏幕变成黑色了
  // runApp(Container(
  //   width: 500,
  //   height: 500,
  //   color: Colors.black,
  //   child: Container(
  //     width: 300,
  //     height: 300,
  //     color: Colors.orange,
  //     child: FlutterLogo(size: 100),
  //   ),
  // ));

  /// demo 03
  /// 无论怎么设置外层宽高都是白色占满整个屏幕
  // runApp(Container(
  //   width: 0.08,
  //   height: 0.08,
  //   // width: 500,
  //   // height: 500,
  //   color: Colors.black,
  //   child: Container(
  //     width: 200,
  //     height: 200,
  //     color: Colors.white,
  //   ),
  // ));

  /// demo 04
  /// 结果200x200的白色在屏幕正中间
  // runApp(Container(
  //   width: 0.08,
  //   height: 0.08,
  //   // width: 500,
  //   // height: 500,
  //   color: Colors.black,
  //   child: Center(
  //     child: Container(
  //       width: 200,
  //       height: 200,
  //       color: Colors.white,
  //     ),
  //   ),
  // ));

  /// demo 05
  runApp(Container(
    width: 0.04,
    height: 0.08,
    color: Colors.red,
    child: Center(
      child: Container(
        width: 500,
        height: 500,
        color: Colors.white,
        /// 试试下面几种方式
        // child: Image.asset('assets/images/layout.jpg', width: 50, height: 50,),
        // child: Image.asset('assets/images/layout.jpg', width: 300, height: 300,),
        // child: Center(child: Image.asset('assets/images/layout.jpg', width: 300, height: 300,)),
        child: Align(
            // alignment: Alignment.topLeft,
            // alignment: Alignment(-1, -1), // 左上角
            // alignment: Alignment(1, 1), // 右下角
            // alignment: Alignment(0, 0), // 居中
            // alignment: Alignment(1, -1), // 右上角
            alignment: Alignment(-1, 1), // 左下角
            child: Image.asset(
              'assets/images/layout.jpg',
              width: 300,
            )),
      ),
    ),
  ));
}
