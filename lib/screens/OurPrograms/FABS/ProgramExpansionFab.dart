import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/widgets/CustomAdvFab.dart';
import 'package:provider/provider.dart';
class ProgramExpansionFab extends StatefulWidget {
  const ProgramExpansionFab({super.key});

  @override
  State<ProgramExpansionFab> createState() => _ProgramExpansionFabState();
}

class _ProgramExpansionFabState extends State<ProgramExpansionFab> {
  final GlobalKey<CustomAdvFabState> fabKey = GlobalKey<CustomAdvFabState>();
  final Map<String, bool> expansionState = {};

  @override
  Widget build(BuildContext context) {
    // Use static list
var  menuItems=  context.watch<ProgramProvider>().mockMenuItems;

    // Initialize expansion state for new items
    for (var item in menuItems) {
      expansionState.putIfAbsent(item.title, () => false);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child:CustomAdvFab(
        key: fabKey,
        icon: Icons.menu,
        iconColor: Customcolor.text_darkblue,
        backgroundColor: Customcolor.programyellow,
        expandedContent: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              final hasChildren = item.children.isNotEmpty;

              return Padding(
                padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                child: Container(
                  color: hasChildren
                      ? (index % 3 == 0
                          ? Color(0xffA9E2FC)
                          : index % 3 == 1
                              ? Color(0xffC1DEA4)
                              : Color(0xffE0C0CB))
                      : Colors.transparent,
                  child: hasChildren
                      ? Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            backgroundColor: hasChildren
                                ? (index % 3 == 0
                                    ? Color(0xffA9E2FC)
                                    : index % 3 == 1
                                        ? Color(0xffC1DEA4)
                                        : Color(0xffE0C0CB))
                                : Colors.transparent,
                            initiallyExpanded: expansionState[item.title] ?? false,
                            onExpansionChanged: (val) {
                              setState(() {
                                expansionState[item.title] = val;
                              });
                            },
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Customcolor.text_darkblue,
                                    fontWeight: FontWeight.w600,
                                    
                                    fontSize:
                                        ResponsiveFlutter.of(context).fontSize(1.8)),
                              ),
                            ),
                            children: item.children
                                .map(
                                  (child) => GestureDetector(
                                    onTap: () {
                                      FabMenuActionHandler.handle(
                                          context: context,
                                          item: child,
                                          fabKey: fabKey);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15,top: 4),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 8),
                                            color: Colors.transparent,
                                            child: Text(
                                              child.title,
                                               textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Customcolor.text_darkblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: ResponsiveFlutter.of(context)
                                                      .fontSize(1.8)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            FabMenuActionHandler.handle(
                                context: context, item: item, fabKey: fabKey);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                   textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Customcolor.text_darkblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          ResponsiveFlutter.of(context).fontSize(1.8)),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
  
    );
  }
}

class FabMenuActionHandler {
static void handle({
  required BuildContext context,
  required FabMenuItem item,
  required GlobalKey<CustomAdvFabState> fabKey,
}) {
  _collapseFab(fabKey);

  final url = item.url ?? '';

  if (_isFile(url)) {
    ShowDialogs.launchURL(url);
    return;
  }

  if (item.title == "Photos" || item.title == "Photo") {
    _openAlbum(context, item, fabKey);
    return;
  }

  if (item.title == "Photo Gallery") {
    _openPhotoGallery(url);
    return;
  }

  _openDetail(url);
}

static void _collapseFab(GlobalKey<CustomAdvFabState> fabKey) {
  if (fabKey.currentState != null) {
    fabKey.currentState!.collapse();
  }
}

  static bool _isFile(String url) {
    return url.endsWith(".pdf") ||
        url.endsWith(".png") ||
        url.endsWith(".jpg") ||
        url.endsWith(".jpeg");
  }

  static void _openAlbum(
    BuildContext context,
    FabMenuItem item,
    GlobalKey<CustomAdvFabState> fabKey,
  ) {
    

   
  }

  static void _openPhotoGallery(String url) {
  
  }

  static void _openDetail(String url) {
   
  }
}
