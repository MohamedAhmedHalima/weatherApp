import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;
  static const JsonType = 'application/json';
  static const UrlencodedType = 'application/x-www-form-urlencoded';
  static const UnauthorizedCode = 401;
  static const InternalServerErrorCode = 500;
    static const AuthorizationParameter = 'Authorization';
  static const Bearer = 'Bearer';

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