import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/views/Home_Page.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}