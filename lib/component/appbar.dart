import 'package:flutter/material.dart';
import 'package:ui_teach_news/constant/const.dart';

class Component {
  static PreferredSizeWidget? appBarViewPost(
      BuildContext context, String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 63,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 26, top: 19),
          child: Text(
            title,
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
