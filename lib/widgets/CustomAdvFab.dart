import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

class CustomAdvFab extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Widget expandedContent;

  const CustomAdvFab({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.expandedContent,
  });

  @override
  CustomAdvFabState createState() => CustomAdvFabState();
}

class CustomAdvFabState extends State<CustomAdvFab>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  void toggle() => setState(() => isExpanded = !isExpanded);
  void collapse() => isExpanded ? toggle() : null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (isExpanded)
          GestureDetector(
            onTap: collapse,
            child: Container(
              color: Colors.transparent,
              width: size.width,
              height: size.height,
            ),
          ),

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              child: isExpanded
                  ? Container(
                      width: size.width * 0.85,
                      height: size.height * 0.45,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Customcolor.programyellow,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black26,
                          )
                        ],
                      ),
                      child: widget.expandedContent,
                    )
                  : const SizedBox.shrink(),
            ),

            FloatingActionButton(
              backgroundColor: widget.backgroundColor,
              onPressed: toggle,
              child: Icon(widget.icon, color: widget.iconColor),
            ),
          ],
        ),
      ],
    );
  }
}
