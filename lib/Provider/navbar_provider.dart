
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
            response.liveWebsiteUrl!;

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