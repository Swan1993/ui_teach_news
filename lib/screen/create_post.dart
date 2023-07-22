import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewPost'),
      ),
      body: const Center(
        child: Text('NewPost'),
      ),
    );
  }
}
