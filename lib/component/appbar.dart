import 'package:flutter/material.dart';
import 'package:ui_teach_news/constant/const.dart';

class Component {
  static PreferredSizeWidget? appBarViewPost(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 63,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 26, top: 19),
          child: Text(
            'عنوان',
            style: Constant.textStyleAppBar,
          ),
        )
      ],
    );
  }

  static PreferredSizeWidget? appBarNewPost(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 63,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 26, top: 19),
          child: Text(
            "ارسال پست",
            style: Constant.textStyleAppBar,
          ),
        )
      ],
    );
  }
}
