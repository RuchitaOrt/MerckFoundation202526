import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';


class Utility extends ChangeNotifier {
  Utility._privateConstructor();
  static final Utility _instance = Utility._privateConstructor();

  factory Utility() {
    return _instance;
  }
  Future<void> loadAPIConfig() async {
    try {
      final value = await rootBundle.loadString(
        'assets/API-Configuration.json',
      );
      APIManager().loadConfiguration(value);
      print("API config loaded successfully");
    } catch (e) {
      print("Error loading API config: $e");
    }
  }
}
