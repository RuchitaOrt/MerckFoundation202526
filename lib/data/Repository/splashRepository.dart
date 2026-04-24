// import 'package:dio/dio.dart';
// import 'package:merckfoundation_252026/Utility/DioClient.dart';
// import 'package:merckfoundation_252026/data/model/GettokenResponse.dart';
// import 'package:merckfoundation_252026/data/model/GetversionResponse.dart';


// class SplashRepository {
//   final Dio dio = DioClient().dio;

//   Future<GetversionResponse> checkVersion() async {
//     final response = await dio.get('mobile_version');
//     return GetversionResponse.fromJson(response.data);
//   }

//   Future<void> updateVersion(String version) async {
//     await dio.post('mobile_version/$version');
//   }

//   Future<GettokenResponse> getToken(String token, String deviceId) async {
//     final response = await dio.get('send_news_letter_notification/$token/$deviceId');
//     return GettokenResponse.fromJson(response.data);
//   }
// }
