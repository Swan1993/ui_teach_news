import 'package:dio/dio.dart';

class RemoteData {
  final Dio _dio = Dio();

  Future<dynamic> read({required String url}) async {
    try {
      Response response = await _dio.get(
        url,
        options: Options(responseType: ResponseType.json, method: "GET"),
      );
      return response.data;
    } catch (error) {
      if (error is DioError) {
        return error.response!;
      }
      return null;
    }
  }
}
