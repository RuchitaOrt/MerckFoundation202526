
// import 'package:dio/dio.dart';
// import 'package:merckfoundation_252026/model/SearchModel.dart';
// class SearchService {
// Future<SearchModel?> search(
//     String keyword,
//     int page,
// ) async {

//   final dio = Dio();
// print("seaxc");
//   FormData formData = FormData.fromMap({
//     "searchtext": keyword,
//     "page": page,
//     "page_size": 10,
//   });
// print(formData);
//   final response = await dio.post(
//     "https://mfv1-uat.ortdemo.com/api/page_structure/search",
//     data: formData,
//     options: Options(
//       contentType: "multipart/form-data",
//     ),
    
//   );
//   print("SEARCH API");
//   print("${formData}");
//  print(response.statusCode);
//   print(response.data);

//   return SearchModel.fromJson(response.data);
// }
// }
// // Future<SearchModel?> search(
// //   String keyword,
// //   int page,
// // ) async {
// //     Map<String, dynamic> body = {
// //        "searchtext": keyword,
// //       "page": page.toString(),
// //       "page_size": "10",
// //     };
// //   final result = await APIManager().apiRequest(
// //     routeGlobalKey.currentContext!,
// //     API.search,
// //     jsonval: body,
// //   );

// //   if (result.data == null) return null;

// //   if (result.data is SearchModel) {
// //     return result.data;
// //   }

// //   if (result.data is String) {
// //     final map = jsonDecode(result.data);
// //     return SearchModel.fromJson(map);
// //   }

// //   if (result.data is Map<String, dynamic>) {
// //     return SearchModel.fromJson(result.data);
// //   }

// //   return null;
// // }
// // }

// // import 'dart:convert';
// // import 'package:dio/dio.dart';
// // import 'package:merckfoundation_252026/model/SearchModel.dart';

// // class SearchService {
// //   Future<SearchModel?> search(
// //     String keyword,
// //     int page,
// //   ) async {
// //     try {
// //       final dio = Dio();

// //       final response = await dio.post(
// //         "https://mfv1-uat.ortdemo.com/api/page_structure/search",
// //         data: {
// //           "searchtext": keyword,
// //           "page": page,
// //           "page_size": 10,
// //         },
// //         options: Options(
// //           headers: {
// //             "Accept": "application/json",
// //             "Content-Type": "application/json",
// //           },
// //         ),
// //       );

// //       print("STATUS : ${response.statusCode}");
// //       print("RESPONSE : ${response.data}");

// //       if (response.statusCode == 200) {
// //         if (response.data is Map<String, dynamic>) {
// //           return SearchModel.fromJson(response.data);
// //         }

// //         if (response.data is String) {
// //           return SearchModel.fromJson(
// //               jsonDecode(response.data));
// //         }
// //       }
// //     } on DioException catch (e) {
// //       print("DIO ERROR");
// //       print(e.message);
// //       print(e.response?.statusCode);
// //       print(e.response?.data);
// //     } catch (e) {
// //       print("ERROR : $e");
// //     }

// //     return null;
// //   }
// // }
import 'package:dio/dio.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/model/SearchModel.dart';

class SearchService {
  Future<SearchModel?> search(
    String keyword,
    int page,
  ) async {
    final dio = Dio();

    print("========== SEARCH API ==========");
    print("Keyword: $keyword");
    print("Page: $page");

    final formData = FormData.fromMap({
      "searchtext": keyword,
      "page": page,
      "page_size": 10,
    });

    print("Request fields:");
    for (final field in formData.fields) {
      print("${field.key} = ${field.value}");
    }

    try {
      final response = await dio.post(
        "${APIManager.baseURL}api/page_structure/search",
        data: formData,
        options: Options(
          // contentType: "multipart/form-data",
          validateStatus: (status) {
            return status != null && status < 600;
          },
        ),
      );

      print("========== SEARCH RESPONSE ==========");
      print("Status: ${response.statusCode}");
      print("Data: ${response.data}");
      print("=====================================");

      if (response.statusCode == 200) {
        return SearchModel.fromJson(response.data);
      }

      print("SEARCH API ERROR");
      print("Status Code: ${response.statusCode}");
      print("Server Response: ${response.data}");

      return null;
    } on DioException catch (e) {
      print("========== DIO ERROR ==========");
      print("Type: ${e.type}");
      print("Message: ${e.message}");
      print("URL: ${e.requestOptions.uri}");
      print("Method: ${e.requestOptions.method}");
      print("Request data: ${e.requestOptions.data}");
      print("Status: ${e.response?.statusCode}");
      print("Response: ${e.response?.data}");
      print("Headers: ${e.response?.headers}");
      print("================================");

      return null;
    } catch (e, stackTrace) {
      print("========== UNKNOWN ERROR ==========");
      print(e);
      print(stackTrace);
      print("==================================");

      return null;
    }
  }
}