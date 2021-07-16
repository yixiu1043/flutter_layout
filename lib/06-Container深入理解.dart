import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container是什么')),
      /// demo 01 没有child有多大占多大，有child会以子元素的尺寸为准
      // body: Container(
      //   color: Colors.orange,
      //   child: FlutterLogo(size: 100),
      // ),
      /// demo 02 有child并且设置alignment属性，就会占满
      // body: Container(
      //   color: Colors.orange,
      //   alignment: Alignment.topLeft, // 试试注释这行
      //   child: FlutterLogo(size: 100),
      // ),
      /// demo 03 Container 被 Column 包裹并且Container没有child的时候，会消失
      /// Column 的布局边界的高度是0到无限，宽度是占满
      // body: Column(
      //   children: [
      //     Container(
      //       // height: 50, // 加个高度验证一下子
      //       color: Colors.orange,
      //       // child: FlutterLogo(size: 100),
      //     ),
      //   ],
      // ),

      /// demo 04 拓展 LimitedBox 和 Placeholder 占位盒子
      body: Column(
        children: [
          // LimitedBox(maxHeight: 100,),
          Placeholder(
            fallbackHeight: 200,
          ),
        ],
      ),
    );
  }
}
