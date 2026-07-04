import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/routes/AppNavigation.dart';

import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonBody.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CustomAdvFab.dart';


class CommonContentPage extends StatefulWidget {
  static const String route = "/commonContent";

  final String? menuID;
  final String? title;
  final String? shareLink;

  const CommonContentPage({super.key, this.menuID, this.title, this.shareLink});

  @override
  State<CommonContentPage> createState() => _CommonContentPageState();
}

class _CommonContentPageState extends State<CommonContentPage> {
  bool isProgramMenuVisible = false;

  List<dynamic> programMenus = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,

        shareLink: widget.shareLink ?? "",
        menuID: widget.menuID ?? "",
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: CommonBody(
        widget.menuID,
        onProgramMenuChanged: (visible, menus) {
          setState(() {
            isProgramMenuVisible = visible;
            programMenus = menus;
          });
        },
      ),
      floatingActionButton: isProgramMenuVisible && programMenus.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomAdvFab(
                icon: Icons.menu,
                iconColor: Colors.white,
                backgroundColor: Customcolor.textBlueColor,
                expandedContent: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: programMenus.length,
                  itemBuilder: (context, index) {
                    final item = programMenus[index];

                    final List submenus = item['submenus'] ?? [];

                    final bool hasSubmenus = submenus.isNotEmpty;

                    /// ✅ WITH SUBMENUS
                    if (hasSubmenus) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:item['color_code'] ??  Customcolor.textBlueColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),

                            childrenPadding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: 8,
                            ),

                            title: Text(
                               stripHtml(item['menu_name'] ?? ""),
                              // item['menu_name'] ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Customcolor.white,
                                fontSize: 12,
                              ),
                            ),

                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Customcolor.white,
                            ),

                            /// ✅ OPEN MAIN PAGE ALSO
                            onExpansionChanged: (expanded) {
                              if (!expanded) return;
                              if (!hasSubmenus) {
                                 if( item['menu_type']=="static")
                                 {
ShowDialogs.launchURL(item['full_url']?? "");
                                 }else{
AppNavigation.navigateByMenuId(
    context,
    menuId:item['id'].toString(),
    title:  item['menu_name'],
    shareLink:item['menu_url'],
    
  
  );
                                 }
                                
                              }
                               
                            },

                            children: submenus.map<Widget>((submenu) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                    submenu['menu_name'] ?? "",
                                    style: const TextStyle(
                                       color: Customcolor.textBlueColor,
                            fontWeight: FontWeight.w600,
                                     
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                  onTap: () {
                                    print("HIT");
                                    print(submenu['menu_type']);
                                     if( submenu['menu_type']=="static")
                                 {
ShowDialogs.launchURL(submenu['full_url']?? "");
                                 }else{
                                     AppNavigation.navigateByMenuId(
    context,
    menuId:submenu['id'].toString(),
    title:  submenu['menu_name'],
    shareLink:submenu['menu_url']);
    
  
                                 }
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }
final Color color = Color(
  int.tryParse(item['color_code']?? '') ?? 0xff0e69af,
);
                    /// ✅ WITHOUT SUBMENUS
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                       color:color ,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          item['menu_name'] ?? "",
                          style: const TextStyle(
                            color: Customcolor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          print("HIT1");
                           if( item['menu_type']=="static")
                                 {
ShowDialogs.launchURL(item['full_url']?? "");
                                 }else{
                             AppNavigation.navigateByMenuId(
    context,
    menuId:item['id'].toString(),
    title:  item['menu_name'],
    shareLink:item['menu_url']);
                                 }
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          : null,
    );
  }
}
