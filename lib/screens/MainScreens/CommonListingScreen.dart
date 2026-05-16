import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/widgets/CommonApiStatusWidget.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';

class CommonListingScreen<T, P> extends StatefulWidget {
  final String title;

  final List<T> Function(P provider) getList;
  final bool Function(P provider) isLoading;
  final bool Function(P provider) hasMore;

  final Future<void> Function(BuildContext) loadInitial;
  final Future<void> Function(BuildContext) loadMore;

  final String Function(T item) getImage;
  final String Function(T item) getTitle;
  final void Function(BuildContext, T item) onTap;
  final Widget? topWidget;
  final String menuID;
 
  

  final String? shareLink;

  final ApiStatus Function(P provider)
    getStatus;

final String Function(P provider)
    getErrorMessage;

final Future<void> Function(
  BuildContext context,
) onRetry;
  const CommonListingScreen({
    super.key,
    required this.title,
    required this.getList,
    required this.isLoading,
    required this.hasMore,
    required this.loadInitial,
    required this.loadMore,
    required this.getImage,
    required this.getTitle,
    required this.onTap,
    this.topWidget, required this.menuID, this.shareLink,
    required this.getStatus,
required this.getErrorMessage,
required this.onRetry,
  });

  @override
  State<CommonListingScreen<T, P>> createState() =>
      _CommonListingScreenState<T, P>();
}

class _CommonListingScreenState<T, P>
    extends State<CommonListingScreen<T, P>> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    /// Initial API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.loadInitial(context);
    });

    /// Pagination
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        widget.loadMore(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        shareLink: widget.shareLink,
      ),
      body: Consumer<P>(
  builder: (context, provider, _) {

    final list =
        widget.getList(provider);

    final status =
        widget.getStatus(provider);

    final errorMessage =
        widget.getErrorMessage(
      provider,
    );

    /// =========================
    /// INITIAL LOADER
    /// =========================

    if (status ==
            ApiStatus.loading &&
        list.isEmpty) {

      return const Center(
        child: CommonLoader(),
      );
    }

    /// =========================
    /// NO INTERNET
    /// =========================

    if (status ==
            ApiStatus.noInternet &&
        list.isEmpty) {

      return CommonApiStatusWidget(
        icon: Icons.wifi_off,

        title:
           CommonStrings.noInternetConnection,

        onRetry: () {

          widget.onRetry(context);
        },
      );
    }

    /// =========================
    /// TIMEOUT
    /// =========================

    if (status ==
            ApiStatus.timeout &&
        list.isEmpty) {

      return CommonApiStatusWidget(
        icon: Icons.access_time,

        title: "Request Timeout",

        onRetry: () {

          widget.onRetry(context);
        },
      );
    }

    /// =========================
    /// SERVER ERROR
    /// =========================

    if (status ==
            ApiStatus.serverError &&
        list.isEmpty) {

      return CommonApiStatusWidget(
        icon: Icons.cloud_off,

        title: "Server Error",

        onRetry: () {

          widget.onRetry(context);
        },
      );
    }

    /// =========================
    /// OTHER ERROR
    /// =========================

    if (status ==
            ApiStatus.error &&
        list.isEmpty) {

      return CommonApiStatusWidget(
        icon: Icons.error_outline,

        title: errorMessage.isEmpty
            ? "Something went wrong"
            : errorMessage,

        onRetry: () {

          widget.onRetry(context);
        },
      );
    }

    /// =========================
    /// EMPTY
    /// =========================

    if (list.isEmpty) {

      return const EmptyStateWidget();
    }

    /// =========================
    /// SUCCESS UI
    /// =========================

    return CustomScrollView(
      controller: _controller,

      slivers: [

        /// TOP WIDGET
        if (widget.topWidget != null)
          SliverToBoxAdapter(
            child:
                widget.topWidget!,
          ),

        /// LIST
        SliverList(
          delegate:
              SliverChildBuilderDelegate(
            (context, index) {

              if (index <
                  list.length) {

                final item =
                    list[index];

                return CommonListCard(
                  imageUrl:
                      widget.getImage(
                    item,
                  ),

                  htmlTitle:
                      widget.getTitle(
                    item,
                  ),

                  onTap: () {

                    widget.onTap(
                      context,
                      item,
                    );
                  },
                );
              }

              /// PAGINATION LOADER
              return widget.hasMore(
                      provider)
                  ? const Padding(
                      padding:
                          EdgeInsets.all(
                        16,
                      ),
                      child: Center(
                        child:
                            CommonLoader(),
                      ),
                    )
                  : const SizedBox();
            },

            childCount:
                list.length + 1,
          ),
        ),

        const SliverToBoxAdapter(
          child: FooterFlowerImage(),
        ),

        const SliverToBoxAdapter(
          child: Bottomcardlink(),
        ),
      ],
    );
  },
),
  //     body: Consumer<P>(
  //       builder: (context, provider, _) {
  //         final list = widget.getList(provider);

  //         /// 🔴 First Loader
  //         if (widget.isLoading(provider) && list.isEmpty) {
  //           return const Center(child: CommonLoader());
  //         }

  //         return CustomScrollView(
  //           controller: _controller,
  //           slivers: [
  //              /// 🔥 TOP WIDGET
  // if (widget.topWidget != null)
  //   SliverToBoxAdapter(
  //     child: widget.topWidget!,
  //   ),
  //             SliverList(
  //               delegate: SliverChildBuilderDelegate(
  //                 (context, index) {
  //                   if (index < list.length) {
  //                     final item = list[index];

  //                     return CommonListCard(
  //                       imageUrl: widget.getImage(item),
  //                       htmlTitle: widget.getTitle(item),
  //                       onTap: () => widget.onTap(context, item),
  //                     );
  //                   }

  //                   /// Pagination Loader
  //                   return widget.hasMore(provider)
  //                       ? const Padding(
  //                           padding: EdgeInsets.all(16),
  //                           child: Center(
  //                               child: CommonLoader()),
  //                         )
  //                       : const SizedBox();
  //                 },
  //                 childCount: list.length + 1,
  //               ),
  //             ),

  //             const SliverToBoxAdapter(child: FooterFlowerImage()),
  //             const SliverToBoxAdapter(child: Bottomcardlink()),
  //           ],
  //         );
  //       },
  //     ),
    );
  }
}