import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/const/GlobalLists.dart';
import '../model/NavBarResponse.dart';
import '../service/navbar_service.dart';

class NavbarProvider extends ChangeNotifier {
  final NavbarService _service = NavbarService();

  bool isLoading = false;

  List<MenuItem> menuList = [];

  List<MobileBottomMenu> mobileBottomMenus = [];

  Future<void> getNavbar(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.fetchNavbar(context);

      menuList = response.data;

      mobileBottomMenus = response.mobileBottomMenus;

      GlobalLists.liveWebsiteUrl =
          response.liveWebsiteUrl;

    } catch (e) {
      print("Navbar Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
