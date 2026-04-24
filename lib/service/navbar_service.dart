import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';

import '../model/NavBarResponse.dart';

class NavbarService {
  final APIManager _apiManager = APIManager();

  Future<NavBarResponse> fetchNavbar(BuildContext context) async {
    final response = await _apiManager.apiRequest(
      context,
      API.navbarmenulist,
    );

    return response as NavBarResponse;
  }
}