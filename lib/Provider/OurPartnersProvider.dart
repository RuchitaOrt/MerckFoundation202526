import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/OurPartnerResponse.dart';
import 'package:merckfoundation_252026/service/OurPartnersService.dart';
class OurPartnersProvider extends ChangeNotifier {
  final OurPartnersService _service = OurPartnersService();

  List<PartnerItem> partners = [];
  int currentPage = 1;

  bool isLoading = false;
  bool isFirstLoad = true;
  bool hasMore = true;

  bool isFetchingMore = false; // 🔥 prevents multiple calls

  /// 🔹 INITIAL LOAD
  Future<void> loadInitial(BuildContext context) async {
    if (isLoading) return;

    isLoading = true;
    isFirstLoad = true;
    notifyListeners();

    try {
      final response = await _service.fetchPartners(context, page: 1);

      partners = response.data;
      currentPage = 1;
      hasMore = response.next != null;
    } catch (e) {
      print("Initial Load Error: $e");
    }

    isLoading = false;
    isFirstLoad = false;
    notifyListeners();
  }

  /// 🔹 LOAD MORE (FIXED)
  Future<void> loadMore(BuildContext context) async {
  if (!hasMore || isFetchingMore) return;

  isFetchingMore = true;
  isLoading = true;
  notifyListeners();

  try {
    final nextPage = currentPage + 1;

    final response =
        await _service.fetchPartners(context, page: nextPage);

    partners.addAll(response.data);
    currentPage = nextPage;
    hasMore = response.next != null;
  } catch (e) {
    print("Load More Error: $e");
  }

  isLoading = false;
  isFetchingMore = false;
  notifyListeners();
}
}