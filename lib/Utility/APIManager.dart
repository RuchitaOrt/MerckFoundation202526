import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:merckfoundation_252026/Utility/AppEror.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/InternetConnection.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/model/NavBarResponse.dart';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum API {
  navbarmenulist,
  pageStructure,
  
}

enum HTTPMethod { GET, POST, PUT, DELETE }

class APIManager {
  static Duration? timeout;
  static String? baseURL;
  static String? apiVersion;

  late Dio dio;
  

  /// 🔒 Singleton
  static final APIManager _instance = APIManager._privateConstructor();

  factory APIManager() => _instance;

  APIManager._privateConstructor() {
    dio = Dio(
      BaseOptions(
        responseType: ResponseType.json,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

   
    _addInterceptors();
  }

 
  /// 🔍 LOGGING + ERROR INTERCEPTOR
  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
       
        onRequest: (options, handler) async {
          final hasInternet = await hasInternetConnection();

          if (!hasInternet) {
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
                error: "No internet connection",
              ),
            );

            FocusScope.of(routeGlobalKey.currentContext!).unfocus();
            showToast("No internet connection. Please check your network.");
            return;
          }

          _logRequest(options);
          handler.next(options);
        },

        onResponse: (response, handler) {
          // Log response details
          _logResponse(response);

          print("🍪 Set-Cookie: ${response.headers['set-cookie']}");
          handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            print("🔒 401 detected");

 
          }

          handler.next(e);
        },

       
      ),
    );
  }

  /// 📝 REQUEST LOGGER
  void _logRequest(RequestOptions options) {
    print('\n' + '=' * 60);
    print('📤 API REQUEST');
    print('=' * 60);
    print('🌐 Method: ${options.method}');
    print('🔗 URL: ${options.baseUrl}${options.path}');
    print('🆔 API Endpoint: ${_getApiNameFromUrl(options.path)}');

    // Log headers (excluding sensitive info)
    if (options.headers.isNotEmpty) {
      print('📋 Headers:');
      final safeHeaders = Map<String, dynamic>.from(options.headers);
      // Remove or mask sensitive headers
      if (safeHeaders.containsKey('authorization')) {
        safeHeaders['authorization'] = 'Bearer ********';
      }
      safeHeaders.forEach((key, value) {
        print('  $key: $value');
      });
    }

    // Log query parameters
    if (options.queryParameters.isNotEmpty) {
      print('🔍 Query Parameters:');
      options.queryParameters.forEach((key, value) {
        print('  $key: $value');
      });
    }

    // Log request body
    if (options.data != null) {
      print('📦 Request Body:');
      if (options.data is Map) {
        final data = options.data as Map;
        // Mask sensitive fields
        final safeData = _maskSensitiveData(data);
        final prettyJson = JsonEncoder.withIndent('  ').convert(safeData);
        print(prettyJson);
      } else if (options.data is String) {
        try {
          final jsonData = jsonDecode(options.data as String);
          final safeData = _maskSensitiveData(jsonData);
          final prettyJson = JsonEncoder.withIndent('  ').convert(safeData);
          print(prettyJson);
        } catch (e) {
          print('  ${options.data}');
        }
      } else {
        print('  ${options.data}');
      }
    }

    print('=' * 60 + '\n');
  }

  /// 📝 RESPONSE LOGGER
  void _logResponse(Response response) {
    print('\n' + '=' * 60);
    print('📥 API RESPONSE');
    print('=' * 60);
    print('✅ Status Code: ${response.statusCode}');
    print(
        '🔗 URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    print(
        '🆔 API Endpoint: ${_getApiNameFromUrl(response.requestOptions.path)}');

    // Log response headers
    if (response.headers.map.isNotEmpty) {
      print('📋 Response Headers:');
      response.headers.forEach((key, values) {
        print('  $key: $values');
      });
    }

    // Log response data
    if (response.data != null) {
      print('📦 Response Body:');
      try {
        if (response.data is Map) {
          final prettyJson =
              JsonEncoder.withIndent('  ').convert(response.data);
          print(prettyJson);
        } else if (response.data is String) {
          final jsonData = jsonDecode(response.data as String);
          final prettyJson = JsonEncoder.withIndent('  ').convert(jsonData);
          print(prettyJson);
        } else {
          print('  ${response.data}');
        }
      } catch (e) {
        print('  ${response.data}');
      }
    }

    // Log response time if available
    if (response.requestOptions.receiveTimeout != null) {
      print('⏱️ Receive Timeout: ${response.requestOptions.receiveTimeout}');
    }

    print('=' * 60 + '\n');
  }

  /// 📝 ERROR LOGGER
 
  /// 🎭 MASK SENSITIVE DATA
  /// 🎭 MASK SENSITIVE DATA
  Map<String, dynamic> _maskSensitiveData(dynamic data) {
    if (data is! Map) return {};

    final Map<String, dynamic> safeData = {};

    // Convert all keys to String
    for (var entry in data.entries) {
      final key = entry.key.toString();
      var value = entry.value;

      // Mask sensitive fields
      if (_isSensitiveField(key)) {
        safeData[key] = '********';
        continue;
      }

      // Handle nested maps
      if (value is Map) {
        safeData[key] = _maskSensitiveData(value);
      }
      // Handle lists
      else if (value is List) {
        final List<dynamic> safeList = [];
        for (var item in value) {
          if (item is Map) {
            safeList.add(_maskSensitiveData(item));
          } else {
            safeList.add(item);
          }
        }
        safeData[key] = safeList;
      }
      // Handle other types
      else {
        safeData[key] = value;
      }
    }

    return safeData;
  }

  /// 🔐 CHECK IF FIELD IS SENSITIVE
  bool _isSensitiveField(String fieldName) {
    final sensitiveFields = [
      'password',
      'token',
      'access_token',
      'refresh_token',
      'authorization',
      'credit_card',
      'cvv',
      'pin',
      'secret',
      'private_key',
      'otp',
      'social_security',
      'ssn',
      'bank_account',
      'api_key'
    ];

    return sensitiveFields.contains(fieldName.toLowerCase());
  }

  /// 🔍 GET API NAME FROM URL
  String _getApiNameFromUrl(String path) {
    for (var api in API.values) {
      if (apiEndPoint(api) == path) {
        return api.toString().split('.').last;
      }
    }
    return 'Unknown API';
  }

  /// ⚙️ CONFIG
  void loadConfiguration(String configString) {
    final config = jsonDecode(configString);
    final env = config['environment'];

    baseURL = config[env]['hostUrl'];
    apiVersion = config['version'];
    timeout = Duration(seconds: config[env]['timeout']);

    dio.options
      ..baseUrl = baseURL!
      ..connectTimeout = timeout
      ..receiveTimeout = timeout;
  }

  /// 🧭 ENDPOINTS
  String apiEndPoint(API api) {
    switch (api) {
      case API.navbarmenulist:
        return "api/users/navbar-menu-list";
     
     case API.pageStructure:
        return "api/page_structure/render-full-page";

    }
  }

  /// 🔁 HTTP METHOD
  HTTPMethod apiHTTPMethod(API api) {
    switch (api) {
      
      case API.navbarmenulist:
        case API.pageStructure:
        return HTTPMethod.GET;
      
        // return HTTPMethod.PUT;
     
        // return HTTPMethod.DELETE;
      default:
        return HTTPMethod.POST;
    }
  }

  /// 🧩 PARSER
  dynamic parseResponse(API api, dynamic json) {
    switch (api) {
      case API.navbarmenulist:
        return NavBarResponse.fromJson(json);
       case API.pageStructure:
        return json;
      default:
        return json;
    }
  }

  /// 🌐 MAIN REQUEST
  Future<dynamic> apiRequest(
    BuildContext context,
    API api, {
    dynamic jsonval,
    String? path,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.request(
        apiEndPoint(api) + (path ?? ""),
        data: jsonval,
        queryParameters: queryParams,
        options: Options(
          method: apiHTTPMethod(api).name,
          // validateStatus: (_) => true,
        ),
      );
      print('Response code: ${response.statusCode}');
       print('Response code: ${response}');
      if (response.statusCode == 200) {
        return parseResponse(api, response.data);
      }

      if (response.statusCode == 400) {
        throw BadRequestError(_serverMessage(response.data));
      }

      throw FetchDataError(_serverMessage(response.data));
    } on DioException catch (e) {
      print(e.error.toString());
      throw FetchDataError(
        e.response != null
            ? _serverMessage(e.response?.data)
            : e.message ?? "Network error",
      );
    }
  }

  String _serverMessage(dynamic data) {
    if (data is Map) {
      return data['message'] ??
          data['desc'] ??
          data['status_Message'] ??
          "Something went wrong";
    }
    return data?.toString() ?? "Something went wrong";
  }

}
