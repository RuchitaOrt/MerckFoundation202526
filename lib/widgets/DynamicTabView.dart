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
              fontSize: MediaQuery.of(context).size.width * 0.040,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Programs ",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: MediaQuery.of(context).size.width * 0.040,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "& Call For ",
            style: TextStyle(
              color: Customcolor.textsubtitlecolor,
              fontSize: MediaQuery.of(context).size.width * 0.040,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Applications",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: MediaQuery.of(context).size.width * 0.040,
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
              fontSize: MediaQuery.of(context).size.width * 0.040,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Ambassadors",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: MediaQuery.of(context).size.width * 0.040,
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
               fontSize: MediaQuery.of(context).size.width * 0.040,
              fontWeight: FontWeight.w300,
              fontFamily: 'times new roman',
            ),
          ),
          TextSpan(
            text: "Library",
            style: TextStyle(
              color: Customcolor.pink_col,
              fontSize: MediaQuery.of(context).size.width * 0.040,
              fontFamily: 'times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
// class DynamicTabView extends StatefulWidget {
//   final List<DynamicTabItem> tabs;
//   final double tabHeight;
//   final Color indicatorColor;

//   const DynamicTabView({
//     super.key,
//     required this.tabs,
//     this.tabHeight = 48,
//     required this.indicatorColor,
//   });

//   @override
//   State<DynamicTabView> createState() => _DynamicTabViewState();
// }

// class _DynamicTabViewState extends State<DynamicTabView>
//     with TickerProviderStateMixin {

//   late TabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: widget.tabs.length, vsync: this);
//   }

//   @override
//   void didUpdateWidget(covariant DynamicTabView oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.tabs.length != widget.tabs.length) {
//       _controller.dispose();
//       _controller =
//           TabController(length: widget.tabs.length, vsync: this);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.tabs.isEmpty) return const SizedBox.shrink();

//     return Column(
//       children: [
//         SizedBox(
//           height: widget.tabHeight,
//           child: TabBar(
//             controller: _controller,
//             isScrollable: true,
//             indicatorColor: Colors.transparent,
//             dividerColor: Colors.transparent,
//             indicator: BubbleTabIndicator(
//               indicatorHeight: 35,
//               indicatorRadius: 6,
//               indicatorColor: widget.indicatorColor.withOpacity(0.4),
//             ),
//             tabs: widget.tabs.map(_buildTab).toList(),
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: _controller,
//             children: widget.tabs.map((e) => e.content).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTab(DynamicTabItem item) {
//     return Tab(child: item.title); // widget-based title
//   }
// }

// class DynamicTabView extends StatefulWidget {
//   final List<DynamicTabItem> tabs;
//   final Color indicatorColor;

//   const DynamicTabView({
//     super.key,
//     required this.tabs,
//     required this.indicatorColor,
//   });

//   @override
//   State<DynamicTabView> createState() => _DynamicTabViewState();
// }

// class _DynamicTabViewState extends State<DynamicTabView> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.tabs.isEmpty) return const SizedBox();

//     return Row(
//       children: [
//         /// 🔥 LEFT SIDE (VERTICAL TABS)
//         Container(
//           width: 140,
//           color: Colors.white,
//           child: ListView.builder(
//             itemCount: widget.tabs.length,
//             itemBuilder: (context, index) {
//               final isSelected = selectedIndex == index;

//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 6, horizontal: 8),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 12, horizontal: 8),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? widget.indicatorColor.withOpacity(0.2)
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: DefaultTextStyle(
//                     style: TextStyle(
//                       color: isSelected
//                           ? widget.indicatorColor
//                           : Colors.black,
//                       fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                     ),
//                     child: widget.tabs[index].title,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),

//         /// 🔥 RIGHT SIDE (CONTENT)
//         Expanded(
//           child: IndexedStack(
//             index: selectedIndex,
//             children: widget.tabs.map((e) => e.content).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
class DynamicTabView extends StatefulWidget {
  final List<DynamicTabItem> tabs;
  final Color indicatorColor;

  const DynamicTabView({
    super.key,
    required this.tabs,
    required this.indicatorColor,
  });

  @override
  State<DynamicTabView> createState() => _DynamicTabViewState();
}

class _DynamicTabViewState extends State<DynamicTabView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.isEmpty) return const SizedBox();

    return  IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// 🔥 LEFT PANEL
      Container(
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          border: Border(
            right: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
      
        child: Column(
  mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
  children: List.generate(
    widget.tabs.length,
    (index) {
      final isSelected = selectedIndex == index;

      return GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 6),
          padding: const EdgeInsets.symmetric(
              vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? widget.indicatorColor.withOpacity(0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? widget.indicatorColor
                        : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                  child: widget.tabs[index].title,
                ),
              ),
              const SizedBox(width: 1),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 4,
                height: isSelected ? 40 : 0,
                decoration: BoxDecoration(
                  color: widget.indicatorColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
),
        // ListView.builder(
        //   shrinkWrap: true, // ✅ VERY IMPORTANT
        //   physics: const NeverScrollableScrollPhysics(), // ✅ disable scroll
        //   padding: const EdgeInsets.symmetric(vertical: 12),
        //   itemCount: widget.tabs.length,
        //   itemBuilder: (context, index) {
        //     final isSelected = selectedIndex == index;

        //     return GestureDetector(
        //       onTap: () {
        //         setState(() => selectedIndex = index);
        //       },
        //       child: AnimatedContainer(
        //         duration: const Duration(milliseconds: 250),
        //         margin: const EdgeInsets.symmetric(
        //             horizontal: 10, vertical: 6),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 14, horizontal: 10),
        //         decoration: BoxDecoration(
        //           color: isSelected
        //               ? widget.indicatorColor.withOpacity(0.12)
        //               : Colors.transparent,
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: DefaultTextStyle(
        //                 style: TextStyle(
        //                   fontSize: 14,
        //                   color: isSelected
        //                       ? widget.indicatorColor
        //                       : Colors.black87,
        //                   fontWeight: isSelected
        //                       ? FontWeight.w600
        //                       : FontWeight.w400,
        //                 ),
        //                 child: widget.tabs[index].title,
        //               ),
        //             ),
        //             const SizedBox(width: 10),
        //             AnimatedContainer(
        //               duration: const Duration(milliseconds: 250),
        //               width: 4,
        //               height: isSelected ? 40 : 0,
        //               decoration: BoxDecoration(
        //                 color: widget.indicatorColor,
        //                 borderRadius: BorderRadius.circular(4),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),

      /// 🔥 RIGHT SIDE
      Expanded(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: IndexedStack(
            key: ValueKey(selectedIndex),
            index: selectedIndex,
            children: widget.tabs.map((e) => e.content).toList(),
          ),
        ),
      ),
    ],
  ),
);
    //  Row(
    //   children: [
    //     /// 🔥 LEFT PANEL (MODERN SIDEBAR)
    //     Container(
    //       width: 150,
    //       decoration: BoxDecoration(
    //         color: const Color(0xffF7F7F7), // soft background
    //         border: Border(
    //           right: BorderSide(
    //             color: Colors.grey.shade300,
    //             width: 1,
    //           ),
    //         ),
    //       ),
    //       child: ListView.builder(
    //         padding: const EdgeInsets.symmetric(vertical: 12),
    //         itemCount: widget.tabs.length,
    //         itemBuilder: (context, index) {
    //           final isSelected = selectedIndex == index;

    //           return GestureDetector(
    //             onTap: () {
    //               setState(() => selectedIndex = index);
    //             },
    //             child: AnimatedContainer(
    //               duration: const Duration(milliseconds: 250),
    //               curve: Curves.easeInOut,
    //               margin: const EdgeInsets.symmetric(
    //                   horizontal: 10, vertical: 6),
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 14, horizontal: 10),
    //               decoration: BoxDecoration(
    //                 color: isSelected
    //                     ? widget.indicatorColor.withOpacity(0.12)
    //                     : Colors.transparent,
    //                 borderRadius: BorderRadius.circular(12),
    //               ),
    //               child: Row(
    //                 children: [
    //                   /// 🔥 LEFT INDICATOR BAR
                     
                    

    //                   /// 🔥 TEXT
    //                   Expanded(
    //                     child: DefaultTextStyle(
    //                       style: TextStyle(
    //                         fontSize: 14,
    //                         color: isSelected
    //                             ? widget.indicatorColor
    //                             : Colors.black87,
    //                         fontWeight: isSelected
    //                             ? FontWeight.w600
    //                             : FontWeight.w400,
    //                       ),
    //                       child: widget.tabs[index].title,
    //                     ),
    //                   ),
    //                     const SizedBox(width: 10),
    //                    AnimatedContainer(
    //                     duration: const Duration(milliseconds: 250),
    //                     width: 4,
    //                     height: isSelected ? 40 : 0,
    //                     decoration: BoxDecoration(
    //                       color: widget.indicatorColor,
    //                       borderRadius: BorderRadius.circular(4),
    //                     ),
    //                   ),

    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),

    //     /// 🔥 RIGHT CONTENT AREA
    //     Expanded(
    //       child: AnimatedSwitcher(
    //         duration: const Duration(milliseconds: 300),
    //         child: IndexedStack(
    //           key: ValueKey(selectedIndex),
    //           index: selectedIndex,
    //           children: widget.tabs.map((e) => e.content).toList(),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}