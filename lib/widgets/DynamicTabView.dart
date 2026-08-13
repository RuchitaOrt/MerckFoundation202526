import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';


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
              vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? widget.indicatorColor.withOpacity(0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child:
                
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected
                        ? widget.indicatorColor
                        :Customcolor.colorBlue,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w800,
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
    
  }
}