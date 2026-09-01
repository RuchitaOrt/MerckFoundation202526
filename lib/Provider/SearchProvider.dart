import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/SearchModel.dart';
import 'package:merckfoundation_252026/service/SearchService.dart';

class SearchProvider extends ChangeNotifier {
  final SearchService _service = SearchService();

  bool isLoading = false;

  List<SearchData> searchList = [];

 
  bool isLoadingMore = false;

 

  int _page = 1;
  bool hasMore = true;

  String currentKeyword = "";
  Future<void> search(String keyword) async {

  currentKeyword = keyword;

  _page = 1;
  hasMore = true;

  isLoading = true;
  notifyListeners();

  print("keyword");
  print(keyword);
final model = await _service.search(keyword, _page);
print(model);
if (model != null) {
  searchList = model.results ?? [];
  hasMore = model.next != null;
}
  

  isLoading = false;
  notifyListeners();
}
Future<void> loadMore() async {

  if (isLoadingMore || !hasMore) return;

  isLoadingMore = true;
  notifyListeners();

  _page++;

  final model = await _service.search(
    currentKeyword,
    _page,
  );

  

if (model != null) {
  searchList.addAll(model.results ?? []);
  hasMore = model.next != null;
}

  isLoadingMore = false;
  notifyListeners();
}

void clearSearch() {

  searchList.clear();

  currentKeyword = "";

  _page = 1;

  hasMore = true;

  notifyListeners();
}
//   Future<void> search(String keyword) async {
//     if (keyword.trim().length < 2) {
//       searchList.clear();
//       notifyListeners();
//       return;
//     }

//     isLoading = true;
//     notifyListeners();

//     final response = await _service.search(keyword);

//     if (response.data != null) {
//       final model = response.data as SearchModel;

//       searchList = model.data ?? [];
//     } else {
//       searchList = [];
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   void clearSearch() {
//   searchList.clear();
//   notifyListeners();
// }
}