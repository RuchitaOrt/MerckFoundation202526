import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/service/UpcomingApplicationService.dart';
class CallApplicationProvider extends ChangeNotifier {
  final service = UpcomingApplicationService();

  List upcoming = [];
  List past = [];

  /// 🔹 Separate pagination
  int upcomingPage = 1;
  int pastPage = 1;

  bool isLoading = false;

  bool hasMoreUpcoming = true;
  bool hasMorePast = true;

  bool isFetchingMoreUpcoming = false;
  bool isFetchingMorePast = false;

  /// 🔹 INITIAL LOAD
  Future<void> loadInitial(BuildContext context) async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      /// 🔥 CALL BOTH APIs
      final upcomingRes = await service.fetchUpcoming(context, 1);
      final pastRes = await service.fetchPast(context, 1);

      upcoming = upcomingRes.data ?? [];
      past = pastRes.data ?? [];

      upcomingPage = 1;
      pastPage = 1;

      hasMoreUpcoming = upcomingRes.next != null;
      hasMorePast = pastRes.next != null;

    } catch (e) {
      print("Initial Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  /// 🔹 LOAD MORE UPCOMING
  Future<void> loadMoreUpcoming(BuildContext context) async {
    if (!hasMoreUpcoming || isFetchingMoreUpcoming) return;

    isFetchingMoreUpcoming = true;
    notifyListeners();

    try {
      final nextPage = upcomingPage + 1;

      final res = await service.fetchUpcoming(context, nextPage);

      upcoming.addAll(res.data ?? []);

      upcomingPage = nextPage;
      hasMoreUpcoming = res.next != null;

    } catch (e) {
      print("Upcoming LoadMore Error: $e");
    }

    isFetchingMoreUpcoming = false;
    notifyListeners();
  }

  /// 🔹 LOAD MORE PAST
  Future<void> loadMorePast(BuildContext context) async {
    if (!hasMorePast || isFetchingMorePast) return;

    isFetchingMorePast = true;
    notifyListeners();

    try {
      final nextPage = pastPage + 1;

      final res = await service.fetchPast(context, nextPage);

      past.addAll(res.data ?? []);

      pastPage = nextPage;
      hasMorePast = res.next != null;

    } catch (e) {
      print("Past LoadMore Error: $e");
    }

    isFetchingMorePast = false;
    notifyListeners();
  }
}