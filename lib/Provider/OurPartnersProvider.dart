
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/model/OurPartnerResponse.dart';
import 'package:merckfoundation_252026/service/OurPartnersService.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

class OurPartnersProvider extends ChangeNotifier {
  final OurPartnersService _service = OurPartnersService();

  List<PartnerItem> partners = [];

  int currentPage = 1;

  bool hasMore = true;
  bool isFetchingMore = false;

  ApiStatus status = ApiStatus.initial;
  String errorMessage = "";

  /// =========================
  /// INITIAL LOAD
  /// =========================
  Future<void> loadInitial(BuildContext context) async {
    status = ApiStatus.loading;
    notifyListeners();

    final result = await _service.fetchPartners(context, page: 1);

    if (result.isSuccess) {
      final response = result.data;

      partners = response?.data ?? []; // 👈 list data
      currentPage = 1;

      hasMore = response?.next != null; // 👈 pagination check

      status = ApiStatus.success;
    } else {
      partners = [];
      errorMessage = result.message ?? "";
      status = ApiStatus.error;
    }

    notifyListeners();
  }

  /// =========================
  /// LOAD MORE
  /// =========================
  Future<void> loadMore(BuildContext context) async {
    if (!hasMore || isFetchingMore) return;

    isFetchingMore = true;
    notifyListeners();

    final nextPage = currentPage + 1;

    final result = await _service.fetchPartners(context, page: nextPage);

    if (result.isSuccess) {
      final response = result.data;

      partners.addAll(response?.data ?? []);
      currentPage = nextPage;

      hasMore = response?.next != null;

      status = ApiStatus.success;
    } else {
      errorMessage = result.message ?? "";
      status = ApiStatus.error;
    }

    isFetchingMore = false;
    notifyListeners();
  }

  /// =========================
  /// RETRY
  /// =========================
  Future<void> retry(BuildContext context) async {
    await loadInitial(context);
  }
}