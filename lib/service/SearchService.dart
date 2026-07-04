
import 'package:dio/dio.dart';
import 'package:merckfoundation_252026/model/SearchModel.dart';
class SearchService {
Future<SearchModel?> search(
    String keyword,
    int page,
) async {

  final dio = Dio();

  FormData formData = FormData.fromMap({
    "searchtext": keyword,
    "page": page,
    "page_size": 10,
  });

  final response = await dio.post(
    "https://mfv1-uat.ortdemo.com/api/page_structure/search",
    data: formData,
    options: Options(
      contentType: "multipart/form-data",
    ),
  );

  print(response.data);

  return SearchModel.fromJson(response.data);
}
}
// Future<SearchModel?> search(
//   String keyword,
//   int page,
// ) async {
//     Map<String, dynamic> body = {
//        "searchtext": keyword,
//       "page": page.toString(),
//       "page_size": "10",
//     };
//   final result = await APIManager().apiRequest(
//     routeGlobalKey.currentContext!,
//     API.search,
//     jsonval: body,
//   );

//   if (result.data == null) return null;

//   if (result.data is SearchModel) {
//     return result.data;
//   }

//   if (result.data is String) {
//     final map = jsonDecode(result.data);
//     return SearchModel.fromJson(map);
//   }

//   if (result.data is Map<String, dynamic>) {
//     return SearchModel.fromJson(result.data);
//   }

//   return null;
// }
// }

// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:merckfoundation_252026/model/SearchModel.dart';

// class SearchService {
//   Future<SearchModel?> search(
//     String keyword,
//     int page,
//   ) async {
//     try {
//       final dio = Dio();

//       final response = await dio.post(
//         "https://mfv1-uat.ortdemo.com/api/page_structure/search",
//         data: {
//           "searchtext": keyword,
//           "page": page,
//           "page_size": 10,
//         },
//         options: Options(
//           headers: {
//             "Accept": "application/json",
//             "Content-Type": "application/json",
//           },
//         ),
//       );

//       print("STATUS : ${response.statusCode}");
//       print("RESPONSE : ${response.data}");

//       if (response.statusCode == 200) {
//         if (response.data is Map<String, dynamic>) {
//           return SearchModel.fromJson(response.data);
//         }

//         if (response.data is String) {
//           return SearchModel.fromJson(
//               jsonDecode(response.data));
//         }
//       }
//     } on DioException catch (e) {
//       print("DIO ERROR");
//       print(e.message);
//       print(e.response?.statusCode);
//       print(e.response?.data);
//     } catch (e) {
//       print("ERROR : $e");
//     }

//     return null;
//   }
// }