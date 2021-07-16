import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// demo 01 得到布局约束
    return Center(
      child: Container(
        width: 400,
        height: 400,
        color: Colors.red[200],
        /// 1.1
        // child: LayoutBuilder(
        //   builder: (BuildContext context, BoxConstraints constraints) {
        //     print('constraints：$constraints'); // constraints：BoxConstraints(w=400.0, h=400.0)
        //     return FlutterLogo(size: 90000,);
        //   },
        // ),

        /// 1.2 包裹Center
        // child: Center(
        //   child: LayoutBuilder(
        //     builder: (BuildContext context, BoxConstraints constraints) {
        //       print('constraints：$constraints'); // constraints：BoxConstraints(0.0<=w<=400.0, 0.0<=h<=400.0)
        //       return FlutterLogo(size: 90000,);
        //     },
        //   ),
        // ),

        /// 1.3 SizeBox组件，受到Container的约束
        // child: SizedBox(
        //   width: 120, // 无效
        //   height: 120, // 无效
        //   child: LayoutBuilder(
        //     builder: (BuildContext context, BoxConstraints constraints) {
        //       print('constraints：$constraints'); // constraints：BoxConstraints(w=400.0, h=400.0)
        //       return FlutterLogo(size: 90000,);
        //     },
        //   ),
        // ),

        /// 1.4 SizeBox + Center组件
        // child: Center(
        //   child: SizedBox(
        //     width: 120,
        //     height: 120,
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(w=120.0, h=120.0)
        //         return FlutterLogo(size: 90000,);
        //       },
        //     ),
        //   ),
        // ),

        /// 1.5 SizeBox.expand + Center组件
        // child: Center(
        //   child: SizedBox.expand( // 占满
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(w=400.0, h=400.0)
        //         return FlutterLogo(size: 90000,);
        //       },
        //     ),
        //   ),
        // ),

        /// 1.6 FractionallySizedBox + Center组件
        // child: Center(
        //   // 得到 200x200的盒子
        //   child: FractionallySizedBox(
        //     widthFactor: 0.5,// 取值0-1之间，0.5x400 = 200
        //     heightFactor: 0.5,// 取值0-1之间
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(w=200.0, h=200.0)
        //         return FlutterLogo(size: 90000,);
        //       },
        //     ),
        //   ),
        // ),

        /// 使用ConstrainedBox设置布局约束
        /// 1.7 ConstrainedBox + Center组件
        // child: Center(
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(
        //       minWidth: 60,
        //       maxWidth: 120,
        //       minHeight: 60,
        //       maxHeight: 120
        //     ),
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(60.0<=w<=120.0, 60.0<=h<=120.0)
        //         return FlutterLogo(size: 100,);
        //       },
        //     ),
        //   ),
        // ),

        /// 1.8 ConstrainedBox + Center组件  infinity
        // child: Center(
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(
        //         minWidth: 60,
        //         maxWidth: double.infinity, // 取父级最大宽度
        //         minHeight: 60,
        //         maxHeight: double.infinity
        //     ),
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(60.0<=w<=400.0, 60.0<=h<=400.0)
        //         return FlutterLogo(size: 180,);
        //       },
        //     ),
        //   ),
        // ),

        /// 1.9 ConstrainedBox.loosen() + Center组件， 设置一个松约束
        // child: Center(
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints().loosen(), // 松约束
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(0.0<=w<=400.0, 0.0<=h<=400.0)
        //         return FlutterLogo(size: 180,);
        //       },
        //     ),
        //   ),
        // ),

        /// 2.0 ConstrainedBox.tightFor() + Center组件， 设置一个紧约束
        // child: Center(
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints.tightFor(width: 120, height: 120), // 紧约束
        //     child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(w=120.0, h=120.0)
        //         return FlutterLogo(size: 180,);
        //       },
        //     ),
        //   ),
        // ),

        /// 2.1 观察 Padding 带来的变化
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print('constraints：$constraints'); // constraints：BoxConstraints(w=360.0, h=360.0)
              return FlutterLogo();
            },
          ),
        ),
      ),
    );
  }
}
