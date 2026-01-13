import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/callforapplication_provider.dart';
import 'package:merckfoundation_252026/widgets/CustomeSwiper.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';

import 'package:merckfoundation_252026/widgets/botttomlink.dart';
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
    return TabBar(
      controller: _tabController,
      labelColor: Customcolor.text_darkblue,
      unselectedLabelColor: Customcolor.text_grey,
      indicatorColor: Customcolor.text_darkblue,
      tabs: [
        Tab(
          child: Text(
           CommonStrings.upcomingPrograms,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
         Tab(
          child: Text(
           CommonStrings.pastCall,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ],
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

    if (data.isEmpty) {
      return  Center(child: Text(CommonStrings.emptyData));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          8.0.heightBox,
          CustomSwiper(items: data),
          8.0.heightBox,
          const FooterFlowerImage(),
          8.0.heightBox,
          const Bottomcardlink(),
        ],
      ),
    );
  }
}
