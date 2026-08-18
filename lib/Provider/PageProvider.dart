

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/model/LayoutModel.dart';
import 'package:merckfoundation_252026/model/ProcessedLayoutModel.dart';
import 'package:merckfoundation_252026/model/StoryModel.dart';
import 'package:merckfoundation_252026/service/PageService.dart';

class PageProvider extends ChangeNotifier {
  final PageService _service = PageService();

  ApiStatus status = ApiStatus.initial;

  bool isLoading = false;

  String errorMessage = "";

  Map<String, dynamic>? pageData;
 final Map<String, List<LayoutModel>> _layouts = {};


  // List<Map<String,dynamic>> layouts = [];
// List<ProcessedLayout> layouts = [];
// List<LayoutModel> layouts = [];
//   List<AwardModel> awards = [];
final Map<String, Map<String, dynamic>> _pageData = {};



final Map<String, List<AwardModel>> _awards = {};
Map<String, dynamic>? pageDataFor(String menuId) {
  return _pageData[menuId];
}

List<LayoutModel> layoutsFor(String menuId) {
  return _layouts[menuId] ?? [];
}

List<AwardModel> awardsFor(String menuId) {
  return _awards[menuId] ?? [];
}
  List<StoryModel> stories = [];

  List<CarouselItem> carouselItems = [];
  Future<void> fetchPage(
    BuildContext context,
    String menuId,
  ) async {
     print("fetchPage() menuId = $menuId");
    print("Layouts called");
    isLoading = true;
    status = ApiStatus.loading;
    errorMessage = "";

    notifyListeners();
print(("Every MEnu id ${menuId}"));
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
         _pageData[menuId] = result.data is Map<String, dynamic>
    ? result.data
    : jsonDecode(jsonEncode(result.data));
        } else {
          pageData = jsonDecode(
            jsonEncode(result.data),
          );
        }
        
       _prepareLayouts(menuId);
_prepareAwards(menuId);

  // _prepareStories();
      } else {
        status = ApiStatus.error;

        errorMessage =
            result.message ?? "Something went wrong";
      }
    } catch (e, stackTrace) {
  print("Error: ${e.toString()}");
  print("StackTrace: $stackTrace");

  status = ApiStatus.noInternet;
  errorMessage = CommonStrings.noInternetConnection;
}

    isLoading = false;

    notifyListeners();
  }
Future<Map<String, dynamic>?> fetchWatchMorePage(
  BuildContext context,
  String menuId,
) async {
  debugPrint("========== WATCH MORE ==========");
  debugPrint("MENU ID = $menuId");

  try {
    final result = await _service.getPageStructure(
      context,
      menuId,
    );



    if (!result.isSuccess) {
      debugPrint("WATCH MORE ERROR = ${result.message}");
      return null;
    }

    if (result.data is Map<String, dynamic>) {
      final response = result.data as Map<String, dynamic>;

      // debugPrint("WATCH MORE RESPONSE = $response");

      return response;
    }

    final response = jsonDecode(
      jsonEncode(result.data),
    );

    if (response is Map<String, dynamic>) {
      // debugPrint("WATCH MORE RESPONSE = $response");
      return response;
    }

    return null;
  } catch (e, stackTrace) {
    debugPrint("WATCH MORE EXCEPTION = $e");
    debugPrint("$stackTrace");
    return null;
  }
}
  
void _prepareLayouts(String menuId) {
 final root = _pageData[menuId]?['data'];

if (root == null) return;
  final List<Map<String, dynamic>> allLayouts = [];
final jsonData = root['json_data'];

if (jsonData == null) return;
void addLayouts(String key) {
  final value = jsonData[key];

  if (value is List) {
    allLayouts.addAll(value.cast<Map<String, dynamic>>());
  }
}

  addLayouts("slider");
  addLayouts("top");
  addLayouts("middle_left");
  addLayouts("middle_right");
  addLayouts("bottom");

  _layouts[menuId] = allLayouts.map((layout) {
    final type = (layout['layout_type'] ?? "")
        .toString()
        .toHomeLayoutType();

    final List<dynamic> content =
        (layout['content'] as List?) ?? [];

    /// Parse StoryModel once
    final stories = content
        .map((e) => StoryModel.fromJson(e))
        .toList();

    /// Parse AwardModel once
    final awards = content
        .map(
          (e) => AwardModel(
            image: e['thumbnail'] ?? "",
            id: e['id'],
            title: e['title'],
            subtitle: e['subtitle'].toString(),
            subdescription: e['subdescription'],
            pageUrl: "",
            status: false,
            menuId: 0,
            isActive: false,
          ),
        )
        .toList();

    /// Parse CarouselItem once
    final carouselItems = content
        .map(
          (e) => CarouselItem(
            image: e['thumbnail'] ?? "",
            title: e['title'] ?? "",
            onTap: null,
          ),
        )
        .toList();

    return LayoutModel(
      type: type,

      title: layout['title'] ?? "",

      mobileView: layout['mobile_view'] ?? "",

      viewButton: layout['view_button'] == true,

      buttonText: layout['button_text'] ?? "",

      buttonLink: layout['button_link'] ?? "",

      buttonMenuId:
          (layout['button_menu_id'] ?? "").toString(),

      contentButton: layout['content_button'],

      content: content,

      stories: stories,

      awards: awards,

      carouselItems: carouselItems,
    );
  }).toList();
}
void _prepareAwards(String menuId) {
  final List<AwardModel> menuAwards = [];

   final root = _pageData[menuId]?['data'];

  if (root == null) return;

  final jsonData = root['json_data'];

  List layouts = [];

  layouts.addAll(jsonData['slider'] ?? []);
  layouts.addAll(jsonData['top'] ?? []);
  layouts.addAll(jsonData['middle_left'] ?? []);
  layouts.addAll(jsonData['middle_right'] ?? []);
  layouts.addAll(jsonData['bottom'] ?? []);

  for (final layout in layouts) {
    if (layout['layout_type'] == "Awards") {
      final content = layout['content'] as List? ?? [];

      menuAwards.addAll(
        content.map(
          (e) => AwardModel(
            image: e['thumbnail'] ?? "",
            id: e['id'],
            title: e['title'],
            subtitle: e['subtitle'].toString(),
            subdescription: e['subdescription'],
            pageUrl: "",
            status: false,
            menuId: 0,
            isActive: false,
          ),
        ),
      );

      break;
    }
  }

  _awards[menuId] = menuAwards;
}

  Future<void> retryPage(
    BuildContext context,
    String menuId,
  ) async {
    await fetchPage(context, menuId);
  }
}