import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';

import 'package:merckfoundation_252026/model/NavBarResponse.dart';

import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/OurPartnerResponse.dart';

enum API {
  navbarmenulist,
  pageStructure,
  mediaList,
  getnewslettersarticles,

  //testimonial
  gettestimonials,
  getvideocategorytestimoniallist,

  getstories,
  getcountrylist,
  getvideocategorylist,

  getvideolibrary,
  getcountrybyvcat,

  ourPartners,
  getphotogallerycategory,

  getactivities,
  getUpcomingApplication,
  getpastapplication,

  //DIGITAL LIBRARY
  getdigitallibrary,
  getlangbydigitalcat,
  listdglibrarycategory,

  getnewsrelease,

  //Testimonial Article
  testimonialarticles,
  testimonialcategory,

  getphotoalbum,
  getphotogalleryimages,

  //EPISODE
  homeseasonlist,
  gethomeepisodelist,
  getepisodeinfo,

  //Our Award
  getawardlist,
  getnewsletterarticlebylanguage,
  getceomessages,
  getambassadorimages,
  mobiledrawermedia,
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
        responseType: ResponseType.plain,
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
      '🔗 URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    print(
      '🆔 API Endpoint: ${_getApiNameFromUrl(response.requestOptions.path)}',
    );

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
          final prettyJson = JsonEncoder.withIndent(
            '  ',
          ).convert(response.data);
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
      'api_key',
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
      case API.mediaList:
        return "api/page_structure/merck-foundation-in-media";
      case API.getnewslettersarticles:
        return "api/page_structure/get-newsletters-articles";

      //TESTIMONIAL
      case API.gettestimonials:
        return "api/page_structure/get-testimonials";
      case API.getvideocategorytestimoniallist:
        return "api/video_library/get-video-category-testimonial-list";

      //STORIES
      case API.getstories:
        return "api/page_structure/get-stories";
      case API.getcountrylist:
        return "api/masters/get-country-list";

      //VIDEO LIBRARY
      case API.getvideocategorylist:
        return "api/video_library/get-video-category-list";
      case API.getvideolibrary:
        return "api/page_structure/get-video-library";
      case API.getcountrybyvcat:
        return "api/page_structure/get-countryby-vcat";

      //OUR PARTNER
      case API.ourPartners:
        return "api/page_structure/our-partners";

      //Photo Gallery
      case API.getphotogallerycategory:
        return "api/page_structure/get-photo-category";

      //ACTIVITY
      case API.getactivities:
        return "api/page_structure/get-activities";

      case API.getUpcomingApplication:
        return "api/page_structure/get-upcoming-application";
      case API.getpastapplication:
        return "api/page_structure/get-past-application";

      case API.getdigitallibrary:
        return "api/page_structure/digital-library";

      case API.listdglibrarycategory:
        return "api/digital_library/list-dglibrary-category";

      case API.getlangbydigitalcat:
        return "api/page_structure/get-lang-bydigitalcat";
      case API.getnewsrelease:
        return "api/page_structure/get-news-release";
      case API.testimonialarticles:
        return "api/page_structure/testimonial-articles";
      case API.testimonialcategory:
        return "api/page_structure/testimonial-category";
      case API.getphotoalbum:
        return "api/page_structure/get-photo-album";
      case API.getphotogalleryimages:
        return "api/page_structure/get-photo-gallery-images";
      case API.homeseasonlist:
        return "api/seasons/home-season-list";
      case API.gethomeepisodelist:
        return "api/seasons/get-home-episode-list";
      case API.getepisodeinfo:
        return "api/seasons/get-episode-info";
      case API.getawardlist:
        return "api/masters/get-award-list";

      case API.getnewsletterarticlebylanguage:
        return "api/page_structure/get-newsletter-article-by-language";

      case API.getceomessages:
        return "api/page_structure/get-ceo-messages";
      case API.getambassadorimages:
        return "api/page_structure/get-ambassador-images";
      case API.mobiledrawermedia:
        return "api/masters/mobile-drawer-media";
    }
  }

  /// 🔁 HTTP METHOD
  HTTPMethod apiHTTPMethod(API api) {
    switch (api) {
      case API.navbarmenulist:
      case API.pageStructure:
      case API.mediaList:
      case API.getcountrylist:
      case API.getvideocategorylist:
      case API.ourPartners:
      case API.getvideocategorytestimoniallist:
      case API.getphotogallerycategory:
      case API.getactivities:
      case API.getUpcomingApplication:
      case API.getpastapplication:
      case API.getnewslettersarticles:
      case API.listdglibrarycategory:
      case API.getnewsrelease:
      case API.testimonialcategory:
      case API.homeseasonlist:
      case API.getawardlist:
      case API.getceomessages:
      case API.mobiledrawermedia:
        return HTTPMethod.GET;

      default:
        return HTTPMethod.POST;
    }
  }

  dynamic parseResponse(API api, dynamic json) {
    switch (api) {
      case API.navbarmenulist:
        return NavBarResponse.fromJson(json);
      case API.pageStructure:
        return json;
      case API.ourPartners:
        return OurPartnersResponse.fromJson(json);

      default:
        return json;
    }
  }

  Future<ApiResult<dynamic>> apiRequest(
    BuildContext context,
    API api, {
    dynamic jsonval,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final url = apiEndPoint(api);

      final response = await dio.request(
        url,
        data: jsonval,
        queryParameters: queryParams,
        options: Options(method: apiHTTPMethod(api).name),
      );

      final data = response.data;

      dynamic parsedData;

      if (data is String) {
        try {
          parsedData = parseResponse(api, jsonDecode(data));
        } catch (_) {
          parsedData = data;
        }
      } else {
        parsedData = parseResponse(api, data);
      }

      return ApiResult(status: ApiStatus.success, data: parsedData);
    } on DioException catch (e) {
      final apiName = api.toString().split('.').last;

      final url = apiEndPoint(api);

      print('\n' + '❌' * 20);

      print("❌ API ERROR");

      print("🆔 API: $apiName");

      print("🔗 URL: $url");

      print("📡 STATUS CODE: ${e.response?.statusCode}");

      print("📦 RESPONSE: ${e.response?.data}");

      print("📨 MESSAGE: ${e.message}");

      print('❌' * 20 + '\n');
      String responseMessage = CommonStrings.somethingWentWrong;

      /// NO INTERNET
      if (e.type == DioExceptionType.connectionError) {
        return ApiResult(
          status: ApiStatus.noInternet,
          message: CommonStrings.noInternetConnection,
        );
      }

      /// TIMEOUT
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return ApiResult(
          status: ApiStatus.timeout,
          message: CommonStrings.requestTimeout,
        );
      }

      final statusCode = e.response?.statusCode ?? 0;

      /// 400
      if (statusCode == 400) {
        return ApiResult(
          status: ApiStatus.badRequest,
          message: responseMessage.isNotEmpty
              ? responseMessage
              : CommonStrings.badRequest,
        );
      }

      /// 401
      if (statusCode == 401) {
        return ApiResult(
          status: ApiStatus.unauthorized,
          message: CommonStrings.unauthorized,
        );
      }

      /// 403
      if (statusCode == 403) {
        return ApiResult(
          status: ApiStatus.forbidden,
          message: CommonStrings.forbidden,
        );
      }

      /// 404
      if (statusCode == 404) {
        return ApiResult(
          status: ApiStatus.notFound,
          message: CommonStrings.notFound,
        );
      }

      /// 422
      if (statusCode == 422) {
        return ApiResult(
          status: ApiStatus.validationError,
          message: responseMessage.isNotEmpty
              ? responseMessage
              : CommonStrings.validationError,
        );
      }

      /// 500+
      if (statusCode >= 500) {
        return ApiResult(
          status: ApiStatus.serverError,
          message: CommonStrings.serverError,
        );
      }

      /// FALLBACK
      return ApiResult(
        status: ApiStatus.error,
        message: CommonStrings.somethingWentWrong,
      );
    } catch (e) {
      print("❌ UNKNOWN ERROR: $e");

      return ApiResult(status: ApiStatus.error, message: e.toString());
    }
  }
}
