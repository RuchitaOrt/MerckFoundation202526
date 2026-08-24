import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

class CustomAdvFab extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Widget expandedContent; final CustomAdvFabController? controller;

  const CustomAdvFab({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.expandedContent,
    this.controller,
  });

  @override
  CustomAdvFabState createState() => CustomAdvFabState();
}

class CustomAdvFabState extends State<CustomAdvFab>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
 @override
  void initState() {
    super.initState();

    widget.controller?._collapse = collapse;
  }

  @override
  void didUpdateWidget(covariant CustomAdvFab oldWidget) {
    super.didUpdateWidget(oldWidget);

    oldWidget.controller?._collapse = null;
    widget.controller?._collapse = collapse;
  }

  @override
  void dispose() {
    widget.controller?._collapse = null;
    super.dispose();
  }
   void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void collapse() {
    if (!mounted) return;

    if (isExpanded) {
      setState(() {
        isExpanded = false;
      });
    }
  }

  // void toggle() => setState(() => isExpanded = !isExpanded);
  // void collapse() => isExpanded ? toggle() : null;

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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutBack,
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
              },
              child: isExpanded
                  ? Container(
                      key: const ValueKey("expanded"),
                      width: size.width * 0.80,
                      height: size.height * 0.60,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Customcolor.officeWhite,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(blurRadius: 10, color: Colors.black26),
                        ],
                      ),
                      child: widget.expandedContent,
                    )
                  : const SizedBox(key: ValueKey("collapsed")),
            ),

            FloatingActionButton(
              backgroundColor: widget.backgroundColor,
              shape: const CircleBorder(),
              onPressed: toggle,
              child: AnimatedRotation(
                turns: isExpanded ? 0.255 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isExpanded ? Icons.close : widget.icon,
                  color: widget.iconColor,
                ),
              ),
              // child: Icon(widget.icon, color: widget.iconColor),
            ),
          ],
        ),
      ],
    );
  }
}
class CustomAdvFabController {
  VoidCallback? _collapse;

  void collapse() {
    _collapse?.call();
  }
}