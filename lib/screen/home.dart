import 'package:flutter/material.dart';
import 'package:ui_teach_news/constant/const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TechNews',
          style: Constant.textStyleAppBar,
        ),
        centerTitle: true,
        toolbarHeight: 63,
        leading: Image.asset('assets/image/icon.png'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
