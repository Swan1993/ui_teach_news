import 'package:ui_teach_news/constant/api_const.dart';

class BlogModel {
  String? id;
  String? title;
  String? image;
  String? view;
  String? status;
  String? createdAt;

  BlogModel();

  BlogModel.fromJosn(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = ApiConst.baseUrl + json["image"];
    view = json["view"];
    status = json["status"];
    createdAt = json["createdAt"];
  }
}
