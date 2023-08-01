// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ui_teach_news/component/appbar.dart';
import 'package:ui_teach_news/constant/const.dart';

class ViewPost extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String contant;
  final String view;
  const ViewPost({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.view,
    required this.contant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the post information based on the index

    return Scaffold(
      appBar: Component.appBarViewPost(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 272,
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    width: 84,
                    height: 33,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(large),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.visibility,
                          color: titleColor,
                        ),
                        Text(
                          view,
                          style: Constant.textStyleHomeLabalRight,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Text(
                title, // تغییر اینجا
                style: Constant.textStyleViewPostTitle,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
              child: Text(
                contant,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
