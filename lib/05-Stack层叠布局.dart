import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green[200],
        child: Stack(
          clipBehavior: Clip.hardEdge, // 超出强制裁剪
          // clipBehavior: Clip.none, // 超出不裁剪
          // alignment: Alignment.center,
          // fit: StackFit.loose, // 默认值
          // fit: StackFit.expand, // 占满父级容器
          children: [
            FlutterLogo(size: 150,),
            Text('Hi', style: TextStyle(fontSize: 70),),
            /// demo 01
            // Positioned(
            //   top: -10,
            //   left: 10,
            //   width: 200,
            //   child: Container(
            //     width: 80,
            //     height: 30,
            //     color: Colors.yellow,
            // ))

            /// demo 02，如果是button超出部分无法响应点击事件
            // Positioned(
            //   top: -10,
            //   left: 10,
            //   width: 200,
            //   child: ElevatedButton(
            //     child: Text(''),
            //     onPressed: () {},
            // ))

            /// demo 03，
            Positioned(
                top: 10,
                left: 10,
                width: 200,
                height: 30,
                child: Transform.translate(
                  offset: Offset(-100, 0),
                  child: ElevatedButton(
                    child: Text(''),
                    onPressed: () {},
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
