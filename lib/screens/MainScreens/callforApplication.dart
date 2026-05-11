import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/Provider/callforapplication_provider.dart';
import 'package:merckfoundation_252026/widgets/CustomeSwiper.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class CallforApplication extends StatefulWidget {
  const CallforApplication({super.key});

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
  Future.microtask(() {
    context.read<CallApplicationProvider>().loadInitial(context);
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
        title: CommonStrings.upcomingPastTitle,

        onSearch: () {},
        onShare: () {},
      ),
      body: Column(
        children: [
          16.0.heightBox,
          _buildTabs(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _EventTab(isUpcoming: true),
                _EventTab(isUpcoming: false),
              ],
            ),
          ),
        ],
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
        indicatorColor: Customcolor.text_darkblue,

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
          ? Customcolor.text_darkblue // ✅ selected = blue
          : Customcolor.text_grey,    // ❌ unselected = grey
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
      return const Center(child: CircularProgressIndicator());
    }

    if (data.isEmpty) {
      return Center(
        child: FormLabel(text: CommonStrings.emptyData),
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
              child: CircularProgressIndicator(),
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
