import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/stories_provider.dart';
import 'package:merckfoundation_252026/widgets/CommonSliverGrid.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/botttomlink.dart';
import 'package:merckfoundation_252026/widgets/mediaCard.dart';
import 'package:provider/provider.dart';
class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<StoriesProvider>().loadStaticStories();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.stories,
       
        onSearch: () {},
        onShare: () {},
        onFilter: () {},
        shareLink: "",
      ),
      backgroundColor: Customcolor.background,
      body: Consumer<StoriesProvider>(
        builder: (context, provider, _) {
          return CustomScrollView(
            slivers: [
              /// 🔹 STORIES GRID
              CommonSliverGrid(
                    items: provider.cards,
                    itemBuilder: (context, item, index) {
                      return MediaCard(data: item);
                    },
                  ),

              /// 🔹 FOOTER IMAGE
              const SliverToBoxAdapter(
                child: FooterFlowerImage(),
              ),

               SliverToBoxAdapter(
                child: 8.0.heightBox,
              ),

              /// 🔹 BOTTOM LINKS
              const SliverToBoxAdapter(
                child: Bottomcardlink(),
              ),

            
            ],
          );
        },
      ),
    );
  }
}
