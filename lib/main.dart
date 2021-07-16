import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 400,
        color: Colors.red[200],
        // child: Column(
        //   children: [
        //     LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         print('constraints：$constraints'); // constraints：BoxConstraints(w=360.0, h=360.0)
        //         return FlutterLogo();
        //       },
        //     ),
        //   ]
        // ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print('constraints：$constraints'); // constraints：BoxConstraints(w=360.0, h=360.0)
            return FlutterLogo();
          },
        ),
      ),
    );
  }
}
