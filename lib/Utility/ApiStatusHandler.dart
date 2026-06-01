import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonApiStatusWidget.dart';

class ApiStatusHandler extends StatelessWidget {
  final ApiStatus status;
  final String errorMessage;
  final VoidCallback onRetry;

  const ApiStatusHandler({
    super.key,
    required this.status,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ApiStatus.noInternet:
        return CommonApiStatusWidget(
          icon: CommonImagePath.noInternet,
          title: CommonStrings.noInternetConnection,
          onRetry: onRetry,
        );

      case ApiStatus.timeout:
        return CommonApiStatusWidget(
          icon: CommonImagePath.timeOut,
          title:CommonStrings.requestTimeout,
          onRetry: onRetry,
        );

      case ApiStatus.serverError:
        return CommonApiStatusWidget(
          icon: CommonImagePath.serverError,
          title: CommonStrings.serverError,
          onRetry: onRetry,
        );

      case ApiStatus.unauthorized:
        return CommonApiStatusWidget(
          icon:CommonImagePath.unauthorized,
          title: CommonStrings.unauthorized,
          onRetry: onRetry,
        );

      case ApiStatus.error:
        return CommonApiStatusWidget(
          icon: CommonImagePath.serverError,
          title: errorMessage.isEmpty ? CommonStrings.somethingWentWrong: errorMessage,
          onRetry: onRetry,
        );
      case ApiStatus.badRequest:
        return CommonApiStatusWidget(
          icon: CommonImagePath.notFound,
          title: errorMessage.isEmpty ? CommonStrings.validationError : errorMessage,
          onRetry: onRetry,
        );

      case ApiStatus.notFound:
        return CommonApiStatusWidget(
          icon:CommonImagePath.notFound,
          title: CommonStrings.notFound,
          onRetry: onRetry,
        );

      case ApiStatus.forbidden:
        return CommonApiStatusWidget(
          icon: CommonImagePath.unauthorized,
          title: CommonStrings.unauthorized,
          onRetry: onRetry,
        );

      case ApiStatus.validationError:
        return CommonApiStatusWidget(
          icon: CommonImagePath.serverError,
          title: errorMessage,
          onRetry: onRetry,
        );
      default:
        return const SizedBox();
    }
  }
}
