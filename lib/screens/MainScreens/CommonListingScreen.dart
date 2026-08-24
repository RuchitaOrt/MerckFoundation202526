import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/widgets/AppDrawerfilter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonList/CommonListCard.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';

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

  final ApiStatus Function(P provider) getStatus;

  final String Function(P provider) getErrorMessage;

  final Future<void> Function(BuildContext context) onRetry;
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
    this.topWidget,
    required this.menuID,
    this.shareLink,
    required this.getStatus,
    required this.getErrorMessage,
    required this.onRetry,
  });

  @override
  State<CommonListingScreen<T, P>> createState() =>
      _CommonListingScreenState<T, P>();
}

class _CommonListingScreenState<T, P> extends State<CommonListingScreen<T, P>> {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawerfilter(type: MediaType.article),
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        shareLink: widget.shareLink ?? "",
        menuID: widget.menuID,

        onFilter: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      body: Consumer<P>(
        builder: (context, provider, _) {
          final list = widget.getList(provider);

          final status = widget.getStatus(provider);

          final errorMessage = widget.getErrorMessage(provider);

          /// =========================
          /// INITIAL LOADER
          /// =========================

          if (status == ApiStatus.loading && list.isEmpty) {
            return const Center(child: CommonLoader());
          }
          if (status != ApiStatus.success &&
              status != ApiStatus.loading &&
              status != ApiStatus.initial) {
            return ApiStatusHandler(
              status: status,
              errorMessage: errorMessage,
              onRetry: () {
                widget.onRetry(context);
              },
            );
          }

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
                SliverToBoxAdapter(child: widget.topWidget!),

              /// LIST
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < list.length) {
                    final item = list[index];

                    return CommonListCard(
                      imageUrl: widget.getImage(item),

                      htmlTitle: widget.getTitle(item),

                      onTap: () {
                        widget.onTap(context, item);
                      },
                    );
                  }

                  /// PAGINATION LOADER
                  return widget.hasMore(provider)
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CommonLoader()),
                        )
                      : const SizedBox();
                }, childCount: list.length + 1),
              ),

              const SliverToBoxAdapter(child: FooterFlowerImage()),

              const SliverToBoxAdapter(child: Bottomcardlink()),
            ],
          );
        },
      ),
    );
  }
}
