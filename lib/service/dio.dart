import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ui_teach_news/api_model/poster_model.dart';

import 'package:http/http.dart' as http;

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

Future<PosterModel> getHomeData() async {
  String url =
      "https://maktabkhooneh.sasansafari.com/Maktabkhooneh/api/home/?command=index";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return PosterModel.fromMap(responseData);
  } else {
    throw Exception('Failed to load server');
  }
}
