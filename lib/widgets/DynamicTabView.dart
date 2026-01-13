import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class Callforapptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Upcoming ",
            style: TextStyle(
              color: Customcolor.textsubtitlecolor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Programs ",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: 18,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "& Call For ",
            style: TextStyle(
              color: Customcolor.textsubtitlecolor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Applications",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: 18,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Merckmtmtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Merck Foundation "More Than A Mother" ',//"Merck Foundation More Than A Mother ",
            style: TextStyle(
              color: Customcolor.textsubtitlecolor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Ambassadors",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: 18,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Digitaltext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Digital ",
            style: TextStyle(
              color: Customcolor.textsubtitlecolor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Library",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: 18,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
class DynamicTabView extends StatefulWidget {
  final List<DynamicTabItem> tabs;
  final double tabHeight;
  final Color indicatorColor;

  const DynamicTabView({
    super.key,
    required this.tabs,
    this.tabHeight = 48,
    required this.indicatorColor,
  });

  @override
  State<DynamicTabView> createState() => _DynamicTabViewState();
}

class _DynamicTabViewState extends State<DynamicTabView>
    with SingleTickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant DynamicTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabs.length != widget.tabs.length) {
      _controller.dispose();
      _controller =
          TabController(length: widget.tabs.length, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: widget.tabHeight,
          child: TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            indicator: BubbleTabIndicator(
              indicatorHeight: 35,
              indicatorRadius: 6,
              indicatorColor: widget.indicatorColor.withOpacity(0.4),
            ),
            tabs: widget.tabs.map(_buildTab).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: widget.tabs.map((e) => e.content).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(DynamicTabItem item) {
    return Tab(child: item.title); // widget-based title
  }
}