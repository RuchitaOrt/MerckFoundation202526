import 'package:flutter/material.dart';
import '../model/NavBarResponse.dart';
import '../service/navbar_service.dart';

class NavbarProvider extends ChangeNotifier {
  final NavbarService _service = NavbarService();

  bool isLoading = false;
  List<MenuItem> menuList = [];

  Future<void> getNavbar(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.fetchNavbar(context);

      menuList = response.data;
    } catch (e) {
      print("Navbar Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}