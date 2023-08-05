//lib
import 'dart:convert';

import 'package:http/http.dart' as http;

//model
import 'package:ui_teach_news/api_model/post_model.dart';

import 'package:ui_teach_news/api_model/poster_model.dart';

import 'package:ui_teach_news/api_model/product_model.dart';

//const

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
// get
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

// new

Future<Product?> fetchProduct() async {
  String url = ApiConst.mainScreenUrl;
  var headersList = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
  };

  var req = http.Request('GET', Uri.parse(url));
  req.headers.addAll(headersList);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    // پارس کردن رشته JSON به داده‌های Dart
    final jsonData = jsonDecode(resBody);

    // ایجاد نمونه از مدل Product با استفاده از تابع fromJson
    final product = Product.fromJson(jsonData);

    return product;
  } else {
    print(res.reasonPhrase);
    return null; // یا مقدار دلخواهی که شما نیاز دارید در صورت بروز خطا
  }
}

//post

Future<Post> createPost(Post post) async {
  var headersList = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };
  var url = Uri.parse(ApiConst.postUrl);

  var response = await http.post(
    url,
    headers: headersList,
    body: jsonEncode(post.toJson()),
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    final jsonData = jsonDecode(response.body);
    final postModel = Post.fromJson(jsonData);
    return postModel;
  } else {
    throw Exception('خطا در ایجاد پست: ${response.reasonPhrase}');
  }
}






/*


Future<BlogModel> getTopVisited() async {
  String url = ApiConst.mainScreenUrl;

  final response1 = await http.get(Uri.parse(url));

  if (response1.statusCode == 200) {
    return BlogModel.fromJson(jsonDecode(response1.body)['top_visited']['index']);
  } else {
    throw Exception('خطا در ارتباط با سرور.');
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
} */