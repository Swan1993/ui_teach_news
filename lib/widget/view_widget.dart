//lib
import 'package:flutter/material.dart';
//model
import 'package:ui_teach_news/api_model/product_model.dart';
//widget

//const
import 'package:ui_teach_news/constant/const.dart';

class ViewWidget extends StatelessWidget {
  const ViewWidget({
    super.key,
    required this.item,
  });

  final TopVisited item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            item.view,
            style: Constant.textStyleHomeLabalRight,
          ),
        ],
      ),
    );
  }
}
