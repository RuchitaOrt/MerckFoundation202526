// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:merckfoundation_252026/Utility/APIManager.dart';

// // // // // import '../model/NavBarResponse.dart';

// // // // // class NavbarService {

// // // // //   final APIManager _apiManager = APIManager();

// // // // //  Future<NavBarResponse> fetchNavbar(BuildContext context) async {
// // // // //   final response = await _apiManager.apiRequest(
// // // // //     context,
// // // // //     API.navbarmenulist,
// // // // //   );

// // // // //   return response as NavBarResponse;
// // // // // }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:merckfoundation_252026/Utility/APIManager.dart';
// // // // import 'package:merckfoundation_252026/Utility/api_result.dart';

// // // // import '../model/NavBarResponse.dart';

// // // // class NavbarService {

// // // //   final APIManager _apiManager = APIManager();

// // // //   Future<ApiResult<NavBarResponse>> fetchNavbar(
// // // //     BuildContext context,
// // // //   ) async {

// // // //     final result = await _apiManager.apiRequest(
// // // //       context,
// // // //       API.navbarmenulist,
// // // //     );

// // // //     /// API FAILED
// // // //     if (!result.isSuccess) {

// // // //       return ApiResult<NavBarResponse>(
// // // //         status: result.status,
// // // //         message: result.message,
// // // //       );
// // // //     }

// // // //     try {

// // // //       final response =
// // // //           NavBarResponse.fromJson(result.data);

// // // //       return ApiResult<NavBarResponse>(
// // // //         status: result.status,
// // // //         data: response,
// // // //       );

// // // //     } catch (e) {

// // // //       return ApiResult<NavBarResponse>(
// // // //         status: result.status,
// // // //         message: e.toString(),
// // // //       );
// // // //     }
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:merckfoundation_252026/Utility/APIManager.dart';
// // // import 'package:merckfoundation_252026/Utility/api_result.dart';

// // // import '../model/NavBarResponse.dart';

// // // class NavbarService {
// // //   final APIManager _apiManager =
// // //       APIManager();

// // //   Future<ApiResult<NavBarResponse>>
// // //       fetchNavbar(
// // //     BuildContext context,
// // //   ) async {
// // //     final result =
// // //         await _apiManager.apiRequest(
// // //       context,
// // //       API.navbarmenulist,
// // //     );

// // //     /// API FAILED
// // //     if (!result.isSuccess) {
// // //       return ApiResult<NavBarResponse>(
// // //         status: result.status,
// // //         message: result.message,
// // //       );
// // //     }

// // //     try {
// // //       final response =
// // //           NavBarResponse.fromJson(
// // //         result.data,
// // //       );

// // //       return ApiResult<NavBarResponse>(
// // //         status: result.status,
// // //         data: response,
// // //       );
// // //     } catch (e) {
// // //       debugPrint(
// // //         "Navbar Parse Error : $e",
// // //       );

// // //       return ApiResult<NavBarResponse>(
// // //         status: result.status,
// // //         message: e.toString(),
// // //       );
// // //     }
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/Utility/APIManager.dart';
// // import 'package:merckfoundation_252026/Utility/api_result.dart';

// // import '../model/NavBarResponse.dart';

// // class NavbarService {

// //   final APIManager _apiManager = APIManager();

// //   Future<ApiResult<NavBarResponse>> fetchNavbar(
// //     BuildContext context,
// //   ) async {

// //     final result = await _apiManager.apiRequest(
// //       context,
// //       API.navbarmenulist,
// //     );

// //     /// API FAILED
// //     if (!result.isSuccess) {

// //       return ApiResult<NavBarResponse>(
// //         status: result.status,
// //         message: result.message,
// //       );
// //     }

// //     try {

// //       /// 🔥 ALREADY PARSED
// //       final response =
// //           result.data as NavBarResponse;

// //       return ApiResult<NavBarResponse>(
// //         status: result.status,
// //         data: response,
// //       );

// //     } catch (e) {

// //       debugPrint(
// //         "Navbar Parse Error : $e",
// //       );

// //       return ApiResult<NavBarResponse>(
// //         status: result.status,
// //         message: e.toString(),
// //       );
// //     }
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:merckfoundation_252026/Utility/api_result.dart';

// import '../model/NavBarResponse.dart';

// class NavbarService {

//   final APIManager _apiManager = APIManager();

//   Future<ApiResult<NavBarResponse>> fetchNavbar(
//     BuildContext context,
//   ) async {

//     final result = await _apiManager.apiRequest(
//       context,
//       API.navbarmenulist,
//     );

//     debugPrint("API RESULT : ${result.data}");

//     /// API FAILED
//     if (!result.isSuccess) {

//       return ApiResult<NavBarResponse>(
//         status: result.status,
//         message: result.message,
//       );
//     }

//     try {

//       /// PARSE JSON TO MODEL
//       final response = NavBarResponse.fromJson(
//         result.data,
//       );

//       debugPrint(
//         "BOTTOM MENUS : ${response.mobileBottomMenus.length}",
//       );

//       return ApiResult<NavBarResponse>(
//         status: result.status,
//         data: response,
//       );

//     } catch (e) {

//       debugPrint(
//         "Navbar Parse Error : $e",
//       );

//       return ApiResult<NavBarResponse>(
//         status: result.status,
//         message: e.toString(),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/model/NavBarResponse.dart';

class NavbarService {

  final APIManager _apiManager = APIManager();

  Future<ApiResult<NavBarResponse>> fetchNavbar(
    BuildContext context,
  ) async {

    final result = await _apiManager.apiRequest(
      context,
      API.navbarmenulist,
    );

    debugPrint("API RESULT : ${result.data}");

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult<NavBarResponse>(
        status: result.status,
        message: result.message,
      );
    }

    try {

      /// ALREADY PARSED OBJECT
      final response =
          result.data as NavBarResponse;

      return ApiResult<NavBarResponse>(
        status: result.status,
        data: response,
      );

    } catch (e) {

     

      return ApiResult<NavBarResponse>(
        status: result.status,
        message: e.toString(),
      );
    }
  }
}