// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

// class CustomAdvFab extends StatefulWidget {
//   final IconData icon;
//   final Color iconColor;
//   final Color backgroundColor;
//   final Widget expandedContent; final CustomAdvFabController? controller;
//  final double? expandedHeight;
//   const CustomAdvFab({
//     super.key,
//     required this.icon,
//     required this.iconColor,
//     required this.backgroundColor,
//     required this.expandedContent,
//     this.controller,
//     this.expandedHeight
//   });

//   @override
//   CustomAdvFabState createState() => CustomAdvFabState();
// }

// class CustomAdvFabState extends State<CustomAdvFab>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//  @override
//   void initState() {
//     super.initState();

//     widget.controller?._collapse = collapse;
//   }

//   @override
//   void didUpdateWidget(covariant CustomAdvFab oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     oldWidget.controller?._collapse = null;
//     widget.controller?._collapse = collapse;
//   }

//   @override
//   void dispose() {
//     widget.controller?._collapse = null;
//     super.dispose();
//   }
//    void toggle() {
//     setState(() {
//       isExpanded = !isExpanded;
//     });
//   }

//   void collapse() {
//     if (!mounted) return;

//     if (isExpanded) {
//       setState(() {
//         isExpanded = false;
//       });
//     }
//   }

//   // void toggle() => setState(() => isExpanded = !isExpanded);
//   // void collapse() => isExpanded ? toggle() : null;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         if (isExpanded)
//           GestureDetector(
//             onTap: collapse,
//             child: Container(
//               color: Colors.transparent,
//               width: size.width,
//               height: size.height,
//             ),
//           ),

//         Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             AnimatedSwitcher(
//               duration: const Duration(milliseconds: 300),
//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: ScaleTransition(
//                     scale: CurvedAnimation(
//                       parent: animation,
//                       curve: Curves.easeOutBack,
//                     ),
//                     child: SlideTransition(
//                       position: Tween<Offset>(
//                         begin: const Offset(0, 0.1),
//                         end: Offset.zero,
//                       ).animate(animation),
//                       child: child,
//                     ),
//                   ),
//                 );
//               },
//               child: isExpanded
//                   ? Container(
//                       key: const ValueKey("expanded"),
//                       width: size.width * 0.80,
//                         height:widget.expandedHeight?? size.height * 0.60,
//                       margin: const EdgeInsets.only(bottom: 12),
//                       decoration: BoxDecoration(
//                         color: Customcolor.officeWhite,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: const [
//                           BoxShadow(blurRadius: 10, color: Colors.black26),
//                         ],
//                       ),
//                       child: widget.expandedContent,
//                     )
//                   : const SizedBox(key: ValueKey("collapsed")),
//             ),

//             FloatingActionButton(
//               backgroundColor: widget.backgroundColor,
//               shape: const CircleBorder(),
//               onPressed: toggle,
//               child: AnimatedRotation(
//                 turns: isExpanded ? 0.255 : 0,
//                 duration: const Duration(milliseconds: 300),
//                 child: Icon(
//                   isExpanded ? Icons.close : widget.icon,
//                   color: widget.iconColor,
//                 ),
//               ),
//               // child: Icon(widget.icon, color: widget.iconColor),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
// class CustomAdvFabController {
//   VoidCallback? _collapse;

//   void collapse() {
//     _collapse?.call();
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

class CustomAdvFab extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Widget expandedContent;
  final CustomAdvFabController? controller;
  final double? expandedHeight;

  const CustomAdvFab({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.expandedContent,
    this.controller,
    this.expandedHeight,
  });

  @override
  CustomAdvFabState createState() => CustomAdvFabState();
}

class CustomAdvFabState extends State<CustomAdvFab> {
  bool isExpanded = false;

  // Used only when we want to close without animation.
  bool _closeImmediately = false;

  @override
  void initState() {
    super.initState();

    widget.controller?._collapse = collapse;
    widget.controller?._collapseImmediately = collapseImmediately;
  }

  @override
  void didUpdateWidget(covariant CustomAdvFab oldWidget) {
    super.didUpdateWidget(oldWidget);

    oldWidget.controller?._collapse = null;
    oldWidget.controller?._collapseImmediately = null;

    widget.controller?._collapse = collapse;
    widget.controller?._collapseImmediately = collapseImmediately;
  }

  @override
  void dispose() {
    widget.controller?._collapse = null;
    widget.controller?._collapseImmediately = null;

    super.dispose();
  }

  // ============================================================
  // NORMAL TOGGLE
  // ============================================================

  void toggle() {
    setState(() {
      _closeImmediately = false;
      isExpanded = !isExpanded;
    });
  }

  // ============================================================
  // NORMAL COLLAPSE
  // This keeps the collapse animation.
  // Used when user taps outside.
  // ============================================================

  void collapse() {
    if (!mounted || !isExpanded) return;

    setState(() {
      _closeImmediately = false;
      isExpanded = false;
    });
  }

  // ============================================================
  // IMMEDIATE COLLAPSE
  // No collapse animation at all.
  // Used when coming back from another screen.
  // ============================================================

  void collapseImmediately() {
    if (!mounted) return;

    setState(() {
      isExpanded = false;
      _closeImmediately = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // ========================================================
        // TRANSPARENT OVERLAY
        // ========================================================

        if (isExpanded)
          GestureDetector(
            onTap: collapse,
            child: Container(
              color: Colors.transparent,
              width: size.width,
              height: size.height,
            ),
          ),

        // ========================================================
        // FAB + EXPANDED CONTENT
        // ========================================================

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ======================================================
            // EXPANDED CONTENT
            // ======================================================

            _buildExpandedContent(size),

            const SizedBox(height: 0),

            // ======================================================
            // FAB
            // ======================================================

            FloatingActionButton(
              backgroundColor: widget.backgroundColor,
              shape: const CircleBorder(),

              onPressed: toggle,

              child: _buildFabIcon(),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // FAB ICON
  //
  // IMPORTANT:
  // If closeImmediately() was called, there is NO animation.
  // ============================================================

  Widget _buildFabIcon() {
    final icon = Icon(
      isExpanded ? Icons.close : widget.icon,
      color: widget.iconColor,
    );

    // ------------------------------------------------------------
    // IMPORTANT:
    // Coming back from another screen.
    // Don't use AnimatedRotation.
    // ------------------------------------------------------------

    if (_closeImmediately) {
      return icon;
    }

    // ------------------------------------------------------------
    // Normal open / close.
    // Keep your rotation animation.
    // ------------------------------------------------------------

    return AnimatedRotation(
      turns: isExpanded ? 0.255 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: icon,
    );
  }

  // ============================================================
  // EXPANDED CONTENT
  // ============================================================

  Widget _buildExpandedContent(Size size) {
    // ------------------------------------------------------------
    // IMMEDIATE CLOSE
    // Don't even create AnimatedSwitcher.
    // ------------------------------------------------------------

    if (_closeImmediately) {
      return const SizedBox.shrink();
    }

    // ------------------------------------------------------------
    // Expanded widget
    // ------------------------------------------------------------

    final expandedWidget = Container(
      key: const ValueKey("expanded"),

      width: size.width * 0.80,

      height: widget.expandedHeight ?? size.height * 0.60,

      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Customcolor.officeWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
          ),
        ],
      ),

      child: widget.expandedContent,
    );

    // ------------------------------------------------------------
    // NORMAL ANIMATED SWITCHER
    // ------------------------------------------------------------

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),

      transitionBuilder: (
        Widget child,
        Animation<double> animation,
      ) {
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
          ? expandedWidget
          : const SizedBox(
              key: ValueKey("collapsed"),
            ),
    );
  }
}


// ============================================================
// CONTROLLER
// ============================================================

class CustomAdvFabController {
  VoidCallback? _collapse;

  VoidCallback? _collapseImmediately;

  // ------------------------------------------------------------
  // Normal animated collapse
  // ------------------------------------------------------------

  void collapse() {
    _collapse?.call();
  }

  // ------------------------------------------------------------
  // Immediate collapse
  // ------------------------------------------------------------

  void collapseImmediately() {
    _collapseImmediately?.call();
  }
}