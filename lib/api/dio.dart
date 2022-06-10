import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;
  static const InternalServerErrorCode = 500;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.openweathermap.org/data/2.5",
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        // contentType: JsonType,
      ),
    );
  }

  static Future<Response<dynamic>> getData({
     required String url ,
    bool isAuth = true,
  }) async {

    Response response =
    await _dio!.get('$url', options: Options(validateStatus: (int? status) {
      return status! < InternalServerErrorCode;
    }));
    print(response.data);

    return response;
  }





}