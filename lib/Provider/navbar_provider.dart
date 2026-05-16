// // import 'package:flutter/material.dart';
// // import 'package:merckfoundation_252026/const/GlobalLists.dart';
// // import '../model/NavBarResponse.dart';
// // import '../service/navbar_service.dart';

// // class NavbarProvider extends ChangeNotifier {
// //   final NavbarService _service = NavbarService();

// //   bool isLoading = false;

// //   List<MenuItem> menuList = [];

// //   List<MobileBottomMenu> mobileBottomMenus = [];

// //   Future<void> getNavbar(BuildContext context) async {
// //     isLoading = true;
// //     notifyListeners();

// //     try {
// //       final response = await _service.fetchNavbar(context);

// //       menuList = response.data;

// //       mobileBottomMenus = response.mobileBottomMenus;

// //       GlobalLists.liveWebsiteUrl =
// //           response.liveWebsiteUrl;

// //     } catch (e) {
// //       print("Navbar Error: $e");
// //     }

// //     isLoading = false;
// //     notifyListeners();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/api_status.dart';
// import 'package:merckfoundation_252026/const/GlobalLists.dart';

// import '../model/NavBarResponse.dart';
// import '../service/navbar_service.dart';

// class NavbarProvider extends ChangeNotifier {

//   final NavbarService _service =
//       NavbarService();

//   bool isLoading = false;

//   ApiStatus status =
//       ApiStatus.initial;

//   String errorMessage = "";

//   List<MenuItem> menuList = [];

//   List<MobileBottomMenu>
//       mobileBottomMenus = [];
// Future<void> getNavbar(
//   BuildContext context,
// ) async {

//   isLoading = true;

//   status = ApiStatus.loading;

//   errorMessage = "";

//   notifyListeners();

//   try {

//     final result =
//         await _service.fetchNavbar(
//       context,
//     );

//     status = result.status;

//     /// 🔥 HANDLE NULL DATA
//     if (result.isSuccess &&
//         result.data != null) {

//       final response =
//           result.data!;

//       menuList =
//           response.data ?? [];

//       mobileBottomMenus =
//           response.mobileBottomMenus ?? [];

//       GlobalLists.liveWebsiteUrl =
//           response.liveWebsiteUrl ?? "";

//     } else {

//       status = ApiStatus.error;

//       errorMessage =
//           result.message ??
//           "No navbar data found";

//       menuList = [];

//       mobileBottomMenus = [];
//     }

//   } catch (e) {

//     errorMessage =
//         e.toString();

//     final error =
//         e.toString().toLowerCase();

//     if (error.contains("socket")) {

//       status =
//           ApiStatus.noInternet;

//     } else if (error.contains(
//         "timeout")) {

//       status =
//           ApiStatus.timeout;

//     } else if (error.contains(
//         "500")) {

//       status =
//           ApiStatus.serverError;

//     } else {

//       status =
//           ApiStatus.error;
//     }

//     debugPrint(
//       "Navbar Error: $e",
//     );
//   }

//   isLoading = false;

//   notifyListeners();
// }
//   // Future<void> getNavbar(
//   //   BuildContext context,
//   // ) async {

//   //   isLoading = true;

//   //   status = ApiStatus.loading;

//   //   errorMessage = "";

//   //   notifyListeners();

//   //   try {

//   //     final result =
//   //         await _service.fetchNavbar(
//   //       context,
//   //     );

//   //     status = result.status;

//   //     if (result.isSuccess) {

//   //       final response =
//   //           result.data!;

//   //       menuList =
//   //           response.data;

//   //       mobileBottomMenus =
//   //           response.mobileBottomMenus;

//   //       GlobalLists.liveWebsiteUrl =
//   //           response.liveWebsiteUrl;

//   //     } else {

//   //       errorMessage =
//   //           result.message ?? "";
//   //     }

//   //   } catch (e) {

//   //     errorMessage =
//   //         e.toString();

//   //     final error =
//   //         e.toString().toLowerCase();

//   //     if (error.contains("socket")) {

//   //       status =
//   //           ApiStatus.noInternet;

//   //     } else if (error.contains(
//   //         "timeout")) {

//   //       status =
//   //           ApiStatus.timeout;

//   //     } else if (error.contains(
//   //         "500")) {

//   //       status =
//   //           ApiStatus.serverError;

//   //     } else {

//   //       status =
//   //           ApiStatus.error;
//   //     }

//   //     debugPrint(
//   //       "Navbar Error: $e",
//   //     );
//   //   }

//   //   isLoading = false;

//   //   notifyListeners();
//   // }

//   Future<void> retryNavbar(
//     BuildContext context,
//   ) async {

//     await getNavbar(context);
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';

import '../model/NavBarResponse.dart';
import '../service/navbar_service.dart';

class NavbarProvider extends ChangeNotifier {
  final NavbarService _service = NavbarService();

  bool isLoading = false;

  ApiStatus status = ApiStatus.initial;

  String errorMessage = "";

  List<MenuItem> menuList = [];

  List<MobileBottomMenu> mobileBottomMenus = [];

  Future<void> getNavbar(
    BuildContext context,
  ) async {
    isLoading = true;

    status = ApiStatus.loading;

    errorMessage = "";

    notifyListeners();

    try {
      final result =
          await _service.fetchNavbar(
        context,
      );

      /// API STATUS
      status = result.status;

      /// SUCCESS
      if (result.isSuccess &&
          result.data != null) {
        final response =
            result.data!;

        menuList =
            response.data;

        mobileBottomMenus =
            response.mobileBottomMenus;

        GlobalLists.liveWebsiteUrl =
            response.liveWebsiteUrl;

        debugPrint(
          "Navbar Loaded Successfully",
        );

        debugPrint(
          "Menus Count : ${menuList.length}",
        );
      } else {
        status = ApiStatus.error;

        errorMessage =
            result.message ??
                "No navbar data found";

        menuList = [];

        mobileBottomMenus = [];
      }
    } catch (e) {
      errorMessage = e.toString();

      final error =
          e.toString().toLowerCase();

      if (error.contains("socket")) {
        status =
            ApiStatus.noInternet;
      } else if (error.contains(
          "timeout")) {
        status =
            ApiStatus.timeout;
      } else if (error.contains(
          "500")) {
        status =
            ApiStatus.serverError;
      } else {
        status = ApiStatus.error;
      }

      debugPrint(
        "Navbar Error: $e",
      );
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> retryNavbar(
    BuildContext context,
  ) async {
    await getNavbar(context);
  }
}