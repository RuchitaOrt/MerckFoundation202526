

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/service/PageService.dart';

class PageProvider extends ChangeNotifier {
  final PageService _service = PageService();

  ApiStatus status = ApiStatus.initial;

  bool isLoading = false;

  String errorMessage = "";

  Map<String, dynamic>? pageData;

  List<Map<String,dynamic>> layouts = [];

  List<AwardModel> awards = [];

  List<StoryModel> stories = [];

  List<CarouselItem> carouselItems = [];
  Future<void> fetchPage(
    BuildContext context,
    String menuId,
  ) async {
    isLoading = true;
    status = ApiStatus.loading;
    errorMessage = "";

    notifyListeners();

    try {
      final result = await _service.getPageStructure(
        context,
        menuId,
      );

      /// ✅ API STATUS
      status = result.status;

      if (result.isSuccess) {
        /// ✅ HANDLE RESPONSE
        if (result.data is Map<String, dynamic>) {
          pageData = result.data;
        } else {
          pageData = jsonDecode(
            jsonEncode(result.data),
          );
        }
        _prepareLayouts();

  _prepareAwards();

  // _prepareStories();
      } else {
        status = ApiStatus.error;

        errorMessage =
            result.message ?? "Something went wrong";
      }
    } catch (e) {
      status = ApiStatus.noInternet;

      errorMessage =  CommonStrings.noInternetConnection;
    }

    isLoading = false;

    notifyListeners();
  }
void _prepareLayouts() {
  layouts.clear();

  final root = pageData?['data'];

  if (root == null) return;

  final json = root['json_data'];

  if (json == null) return;

  void addLayouts(String key) {
    final value = json[key];

    if (value is List) {
      layouts.addAll(value.cast<Map<String, dynamic>>());
    }
  }

  addLayouts("slider");
  addLayouts("top");
  addLayouts("middle_left");
  addLayouts("middle_right");
  addLayouts("bottom");
}
void _prepareAwards(){
print("Awards called");
    awards.clear();

    final root = pageData?['data'];

    if(root == null) return;

    final json = root['json_data'];

    List layouts = [];

    layouts.addAll(json['slider'] ?? []);
    layouts.addAll(json['top'] ?? []);
    layouts.addAll(json['middle_left'] ?? []);
    layouts.addAll(json['middle_right'] ?? []);
    layouts.addAll(json['bottom'] ?? []);

  for (final layout in layouts) {
  print("Layout Type = ${layout['layout_type']}");

  if (layout['layout_type'] == "Awards") {
    print("Award layout found");

    final content = layout['content'] as List? ?? [];

    print("Award content length = ${content.length}");

    awards = content.map((e) => AwardModel(
      image: e['thumbnail'] ?? "",
      id: e['id'],
      title: e['title'],
      subtitle: e['subtitle'],
      subdescription: e['subdescription'],
      pageUrl: "",
      status: false,
      menuId: 0,
      isActive: false,
    )).toList();

    print("Awards parsed = ${awards.length}");

    break;
  }
}

  }

  Future<void> retryPage(
    BuildContext context,
    String menuId,
  ) async {
    await fetchPage(context, menuId);
  }
}