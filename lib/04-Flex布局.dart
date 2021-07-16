import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// demo 01
    return Center(
      child: Container(
        color: Colors.red[200],
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // verticalDirection: VerticalDirection.up,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlutterLogo(size: 50),
            FlutterLogo(size: 100),
            // Flexible 的 fix 属性默认为 FlexFit.loose，而 Expanded 继承 Flexible，
            // 其 fix 属性指定为 FlexFit.tight，两者因为其 fix 属性不用而不同，
            // 若将 Flexible 的 fit 属性设置为 FlexFit.tight，则 Flexible 与 Expanded 等效，可设置的 fit 属性如下：
            // tight：强制填充可利用的空间；
            // loose：不强制填充可利用空间，Widget自身大小
            //
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
              width: 20,
              height: 20,
              color: Colors.blue[100],
            )),
            SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: Container(
                width: 20,
                height: 20,
                color: Colors.blue[100],
            )),
            FlutterLogo(size: 150),
            FlutterLogo(size: 200)
          ],
        ),
      ),
    );
  }
}
