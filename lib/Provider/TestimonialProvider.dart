import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/service/TestimonialService.dart';

class TestimonialArticleProvider
    extends ChangeNotifier {

  final TestimonialService _service =
      TestimonialService();

  bool isLoading = false;

  List<TestimonialModel> testimonials = [];

  Future<void> fetchTestimonials(
      String categoryId) async {

    isLoading = true;
    notifyListeners();

    try {

      final response =
          await _service.fetchTestimonials(
              categoryId);

      testimonials =
          (response['data'] as List)
              .map((e) =>
                  TestimonialModel.fromJson(e))
              .toList();

    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}