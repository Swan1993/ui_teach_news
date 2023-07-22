import 'dart:convert';

import 'package:ui_teach_news/api_model/blog_model.dart';
import 'package:ui_teach_news/api_model/poster_model.dart';

import 'package:http/http.dart' as http;
import 'package:ui_teach_news/constant/api_const.dart';
/*
class RemoteData {

  final Dio _dio = Dio();

  Future<dynamic> read({required String url}) async {
    try {
      Response<Map<String, dynamic>> response =
          await _dio.get<Map<String, dynamic>>(
        url,
        options: Options(responseType: ResponseType.json, method: "GET"),
      );
      return response.data;
    } catch (error) {
      if (error is DioException) {
        return error.response!;
      }
      return null;
    }
  }
}

*/

Future<PosterModel> getHomeData() async {
  String url = ApiConst.mainScreenUrl;

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return PosterModel.fromMap(responseData);
  } else {
    throw Exception(
      'Failed to load server. Status code: ${response.statusCode}',
    );
  }
}

Future<List<BlogModel>> getTopVisited() async {
  String url = ApiConst.mainScreenUrl;

  final response1 = await http.get(Uri.parse(url));

  if (response1.statusCode == 200) {
    Map<String, dynamic> responseData =
        jsonDecode(response1.body) as Map<String, dynamic>;
    List<dynamic> topVisitedList = responseData['top_visited'] as List<dynamic>;

    if (topVisitedList.isNotEmpty) {
      List<BlogModel> blogModels = topVisitedList
          .map((item) => BlogModel.fromMap(item as Map<String, dynamic>))
          .toList();
      return blogModels;
    } else {
      throw Exception('No data found in "top_visited" list.');
    }
  } else {
    throw Exception(
      'Failed to load server. Status code: ${response1.statusCode}',
    );
  }
}
