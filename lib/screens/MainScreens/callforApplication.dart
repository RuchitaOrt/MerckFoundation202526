import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/Provider/callforapplication_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CustomeSwiper.dart';

import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class CallforApplication extends StatefulWidget {
   final String menuID;
  final String title;
  

  final String? shareLink;
  const CallforApplication({super.key, required this.menuID, required this.title, this.shareLink});

  @override
  State<CallforApplication> createState() => _CallforApplicationState();
}

class _CallforApplicationState extends State<CallforApplication>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

 @override
void initState() {
  super.initState();

  _tabController = TabController(length: 2, vsync: this);

  /// 🔥 CALL INITIAL API
WidgetsBinding.instance.addPostFrameCallback((_) {
  context
      .read<CallApplicationProvider>()
      .loadInitial(context);
});
}
  @override
  void dispose() {
    _tabController.dispose();
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
       shareLink: widget.shareLink ?? "",
       menuID: widget.menuID,
      ),
      body: Consumer<CallApplicationProvider>(
  builder: (context, provider, child) {

    /// LOADING
    if (provider.isLoading &&
        provider.upcoming.isEmpty &&
        provider.past.isEmpty) {

      return const Center(
        child: CommonLoader(),
      );
    }
 if (provider.status != ApiStatus.success &&
    provider.status != ApiStatus.loading &&
    provider.status != ApiStatus.initial) {

  return ApiStatusHandler(
    status: provider.status,
    errorMessage: provider.errorMessage,
    onRetry: () {
        provider.retry(context);
      },
  );
}
    
    /// SUCCESS UI
    return Column(
      children: [

        16.0.heightBox,

        _buildTabs(),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics:
                const NeverScrollableScrollPhysics(),
            children: const [
              _EventTab(
                isUpcoming: true,
              ),
              _EventTab(
                isUpcoming: false,
              ),
            ],
          ),
        ),
      ],
    );
  },
),
     
    );
  }

 Widget _buildTabs() {
  final responsive =
      ResponsiveFlutter.of(routeGlobalKey.currentContext!);

  return AnimatedBuilder(
    animation: _tabController,
    builder: (context, _) {
      return TabBar(
        controller: _tabController,
        indicatorColor: Customcolor.textDarkBlueColor,

        tabs: [
          _buildTab(
            text: CommonStrings.upcomingPrograms,
            isSelected: _tabController.index == 0,
            responsive: responsive,
          ),
          _buildTab(
            text: CommonStrings.pastCall,
            isSelected: _tabController.index == 1,
            responsive: responsive,
          ),
        ],
      );
    },
  );
}
Widget _buildTab({
  required String text,
  required bool isSelected,
  required dynamic responsive,
}) {
  return Tab(
    child: FormLabel(
      text: text,
      textAlignment: TextAlign.center,
      fontSize: responsive.fontSize(2.3),
      labelColor: isSelected
          ? Customcolor.textDarkBlueColor // ✅ selected = blue
          : Customcolor.textGreyColor,    // ❌ unselected = grey
      fontweight: FontWeight.w700,
    ),
  );
}
}
class _EventTab extends StatelessWidget {
  final bool isUpcoming;

  const _EventTab({required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CallApplicationProvider>();

    final data = isUpcoming ? provider.upcoming : provider.past;

    final isLoadingMore =
        isUpcoming ? provider.isFetchingMoreUpcoming : provider.isFetchingMorePast;

    final hasMore =
        isUpcoming ? provider.hasMoreUpcoming : provider.hasMorePast;

    if (provider.isLoading && data.isEmpty) {
      return const Center(child: CommonLoader());
    }

    if (data.isEmpty) {
      return  CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      /// CENTER CONTENT
                      Expanded(child: EmptyStateWidget()),

                      const FooterFlowerImage(),

                      const SizedBox(height: 8),
                      const Bottomcardlink(),
                    ],
                  ),
                ),
              ],
            );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          8.0.heightBox,

          /// 🔥 SWIPER WITH PAGINATION
          CustomSwiper(
            items: data,
            onIndexChanged: (index) {
              final provider = context.read<CallApplicationProvider>();

              if (index >= data.length - 2 && !isLoadingMore && hasMore) {
                if (isUpcoming) {
                  provider.loadMoreUpcoming(context);
                } else {
                  provider.loadMorePast(context);
                }
              }
            },
          ),

          /// 🔹 LOAD MORE LOADER
          if (isLoadingMore)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CommonLoader(),
            ),

          8.0.heightBox,
          const FooterFlowerImage(),
          8.0.heightBox,
          const Bottomcardlink(),
        ],
      ),
    );
  }
}
