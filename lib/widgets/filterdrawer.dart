// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Provider/FilterProvider.dart';
// import 'package:merckfoundation_252026/Provider/StoryProvider.dart';
// import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
// import 'package:merckfoundation_252026/Utils/customcolor.dart';

// import 'package:provider/provider.dart';

// class AppDrawerfilter extends StatefulWidget {
//   final int? index;

//   const AppDrawerfilter({Key? key, this.index}) : super(key: key);
//   @override
//   _AppDrawerfilterState createState() => _AppDrawerfilterState();
// }

// class _AppDrawerfilterState extends State<AppDrawerfilter> {
//   bool iscountryexpanded = false;
//   List option = ["option1", "option2", "option3"];
//   var countryController = TextEditingController();
//   bool isvideocategoryexpanded = false;
//   var videocategoryController = TextEditingController();
//   bool isyearexpanded = false;
//   var yearController = TextEditingController();
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   String countryid = "";
//   String catid = "";
//   String title = "";
//   String langid = "";
//   bool isfilterLoaded = true;

//   bool isdigitalcategoryexpanded = false;
//   var digitalcategoryController = TextEditingController();

//   bool islanexpanded = false;
//   var languageController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Drawer(
//       //  ScaffoldState().openDrawer() ,
//       child: Container(
//         color: Colors.white,
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 0),
//               child: widget.index == 2
//                   ? ListView(
//                       padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
//                       shrinkWrap: true,
//                       children: [
//                         Text("Country"),
//                         SizedBox(height: 10),
//                         Container(
//                           height: 80,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 print("in state");
//                                 iscountryexpanded = !iscountryexpanded;
//                               });
//                             },
//                             child: TextField(
//                               enabled: false,
//                               controller: countryController,
//                               decoration: InputDecoration(
//                                 // contentPadding:
//                                 //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
//                                 hintText: "Select Country",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 suffixIcon: Icon(Icons.arrow_drop_down),
//                               ),
//                             ),
//                           ),
//                         ),
//                         iscountryexpanded == true
//                             ? coutryDropdown()
//                             : Container(),
//                         SizedBox(height: 15),
//                       ],
//                     )
//                   : Container(),
//             ),
//             Visibility(
//               visible: isfilterLoaded,
//               replacement: Center(child: CircularProgressIndicator()),
//               child: Container(),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 10, left: 15),
//                 height: 60,
//                 child: GestureDetector(
//                   onTap: () {
//                     final filter = context.read<FilterProvider>();
//                     final storyProvider = context.read<StoryProvider>();

//                     Navigator.pop(context);

//                     /// ✅ RESET DATA
//                     storyProvider.currentPage = 1;
//                     storyProvider.storyList.clear();

//                     /// ✅ LOAD NEW FILTER DATA
//                     storyProvider.loadInitial(
//                       context,
//                       filter.selectedCountry?.id.toString() ?? "",
//                     );

//                     Scrollable.ensureVisible(
//                       context,
//                       duration: Duration(milliseconds: 300),
//                     );
//                   },
//                   child: Container(
//                     width: 110,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Customcolor.text_darkblue,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Apply",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }

//   Widget coutryDropdown() {
//     return Consumer<FilterProvider>(
//       builder: (context, provider, _) {
//         if (provider.isLoading) {
//           return const SizedBox(
//             height: 200,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         }

//         return Container(
//           height: 200,
//           child: ListView.builder(
//             itemCount: provider.countries.length,
//             itemBuilder: (context, index) {
//               final item = provider.countries[index];

//               return GestureDetector(
//                 onTap: () {
//                   provider.selectCountry(item);
//                   provider.selectedCountryID = item.id.toString();
//                   countryController.text = item.name;
//                   countryid = item.id.toString();

//                   setState(() => iscountryexpanded = false);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: Text(item.name),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:provider/provider.dart';
import '../Provider/FilterProvider.dart';
import '../Provider/MediaListingProvider.dart';
import '../Utils/customcolor.dart';


class AppDrawerfilter extends StatefulWidget {
  final MediaType type;

  const AppDrawerfilter({super.key, required this.type});

  @override
  State<AppDrawerfilter> createState() => _AppDrawerfilterState();
}

class _AppDrawerfilterState extends State<AppDrawerfilter> {
  bool isCountryExpanded = false;
  bool isCategoryExpanded = false;

  TextEditingController countryController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  bool showCountry() {
    return widget.type == MediaType.stories ||
        widget.type == MediaType.videoLibrary;
  }

  bool showCategory() {
    return widget.type == MediaType.videoLibrary ||
        widget.type == MediaType.testimonial;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          children: [
            if (showCountry()) ...[
              const Text("Country"),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() => isCountryExpanded = !isCountryExpanded);
                },
                child: TextField(
                  controller: countryController,
                  enabled: false,
                  decoration: const InputDecoration(
                    hintText: "Select Country",
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
              if (isCountryExpanded) countryDropdown(),
              const SizedBox(height: 20),
            ],

            if (showCategory()) ...[
              const Text("Category"),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() => isCategoryExpanded = !isCategoryExpanded);
                },
                child: TextField(
                  controller: categoryController,
                  enabled: false,
                  decoration: const InputDecoration(
                    hintText: "Select Category",
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
              // 👉 you can plug category dropdown here later
              if (isCategoryExpanded) categoryDropdown(),
              const SizedBox(height: 20),
            ],

            const Spacer(),

            GestureDetector(
             onTap: () {
  final filter = context.read<FilterProvider>();
  final provider = context.read<MediaListingProvider>();

  Navigator.pop(context);

  provider.loadInitial(
    context: context,
    type: widget.type,
    countryId: filter.selectedCountry?.id.toString() ?? "",
    categoryId: filter.selectedCategory?.id.toString() ?? "",
  );
},
              child: Container(
                width: 120,
                height: 45,
                decoration: BoxDecoration(
                  color: Customcolor.text_darkblue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text("Apply",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget countryDropdown() {
    return Consumer<FilterProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CircularProgressIndicator();
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: provider.countries.length,
            itemBuilder: (context, index) {
              final item = provider.countries[index];

              return ListTile(
                title: Text(item.name),
                onTap: () {
                  provider.selectCountry(item);
                  countryController.text = item.name;
                  setState(() => isCountryExpanded = false);
                },
              );
            },
          ),
        );
      },
    );
  }

Widget categoryDropdown() {
  return Consumer<FilterProvider>(
    builder: (context, provider, _) {
      if (provider.isLoading) {
        return const CircularProgressIndicator();
      }

      if (provider.categories.isEmpty) {
        return const Text("No categories found");
      }

      return SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: provider.categories.length,
          itemBuilder: (context, index) {
            final item = provider.categories[index];

            return ListTile(
              title: Text(item.name),
              onTap: () {
                provider.selectCategory(item);
                categoryController.text = item.name;
                setState(() => isCategoryExpanded = false);
              },
            );
          },
        ),
      );
    },
  );
}
}