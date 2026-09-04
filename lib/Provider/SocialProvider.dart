import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/service/SocialMediaService.dart';

class SocialProvider extends ChangeNotifier {
  final SocialMediaService service;

  SocialProvider(this.service);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _socialMediaList = [];
  List<dynamic> get socialMediaList => _socialMediaList;
   
List<dynamic> _socialMediaListCommon = [];
List<dynamic> get socialMediaListCommon => _socialMediaListCommon;

void setSocialMediaList(List<dynamic> data) {
  _socialMediaListCommon = data;
  notifyListeners();
}
  Future<void> getSocialMediaDrawer(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await service.fetchSocialMediaDrawer(context);

      if (result.status==ApiStatus.success) {
        _socialMediaList = result.data['data'] ?? [];
      }
    } catch (e) {
      debugPrint("Social Media Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

    Future<void> retryNavbar(
    BuildContext context,
  ) async {
    await getSocialMediaDrawer(context);
  
  }
}