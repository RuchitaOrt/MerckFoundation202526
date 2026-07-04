import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation_252026/Provider/EpisodeProvider.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonBorderButton.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';

import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utility/sizeConfig.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';



class EpisodeInformation extends StatefulWidget {
  final String episodeid;
 final String menuID;
  final String title;
  

  final String? shareLink;


   EpisodeInformation({
    Key? key,
    required this.episodeid, required this.menuID, required this.title, this.shareLink,
  }) : super(key: key);

  @override
  State<EpisodeInformation> createState() => _EpisodeInformationState();
}

class _EpisodeInformationState extends State<EpisodeInformation> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<EpisodeProvider>();
      provider.getEpisodeInfo(context, int.parse(widget.episodeid));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final provider = context.watch<EpisodeProvider>();
    final data = provider.episodeInfo;
    if (provider.status != ApiStatus.success &&
    provider.status != ApiStatus.loading &&
    provider.status != ApiStatus.initial) {

  return ApiStatusHandler(
    status: provider.status,
    errorMessage: provider.errorMessage,
    onRetry: () {
        provider.retryEpisodeInfo(
          context,
          int.parse(widget.episodeid),
        );
      },
  );
}

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: "Episode Information",
        onSearch: () {},
       shareLink: widget.shareLink ?? "",
       menuID: widget.menuID,

      ),
      body: provider.isLoading
          ?  Center(child: CommonLoader())
          : data == null
              ?  Center(child:EmptyStateWidget(),)
              : ListView(
                  children: [
                    _buildSectionTitle(
                        "Our Africa by Merck Foundation (TV Program) Brief:"),

                    _htmlBlock(data.showBrief),

                    _buildSectionTitle("Episode Brief:"),

                    _htmlBlock(data.episodeBrief),

                    _buildSectionTitle("Guests & Designer Information:"),

                    _htmlBlock(data.guestInfo),

                    _buildSectionTitle("Credits:"),

                    _htmlBlock(data.credits),

                     SizedBox(height: 10),

                    Center(
            child: CommonBorderButton(
              title: "Watch More Episode",
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MediaListingScreen(
                        type: MediaType.episodes,
                        categoryID: widget.episodeid,
                        albumID: "",
                        albumName:"Episodes",
                        menuID: widget.menuID,
                        title: widget.title,
                        shareLink: widget.shareLink,
                      ),
                    ),
                  );
              },
            ),
          ),

                     SizedBox(height: 20),

                    _buildSectionTitle("Related News:"),

                    _htmlBlock(data.relatedNews),

                     SizedBox(height: 20),

                    _photoGallery(data),
                     SizedBox(height: 20),
                    
          const FooterFlowerImage(),
          8.0.heightBox,
          const Bottomcardlink(),
                  ],
                ),
    );
  }

  // 🔹 Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Text(
         stripHtml(title),
        // title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Customcolor.pinkColor,
        ),
      ),
    );
  }

  // 🔹 HTML Renderer
  Widget _htmlBlock(String htmlData) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8),
      child: Html(
        data: htmlData,
        onLinkTap: (url, _, __) {
          if (url != null) {
            ShowDialogs.launchURL(url);
          }
        },
        style: {
          "body": Style(textAlign: TextAlign.start),
        },
      ),
    );
  }


  // 🔹 Photo Gallery
  Widget _photoGallery(data) {
    if (data.photoGalleryList.isEmpty) {
      return  SizedBox();
    } 
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Photos"),

          SizedBox(
            height: 180,
            child: Padding(
              padding:  EdgeInsets.only(left: 15,top: 5),
              child: 
             ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: data.photoGalleryList.length,
  itemBuilder: (context, index) {
    final item = data.photoGalleryList[index];

    return Container(
      width: 160,
      margin:  EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.photo,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    CommonImagePath.placeHolder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

           SizedBox(height: 5),

          FormLabel(
            text: item.photoDescription,
            maxLines: 3,
            textAlignment: TextAlign.start,
            fontSize: screenWidth * 0.030,
            labelColor: Colors.black87,
            fontweight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  },
)
            ),
          ),
        ],
      ),
    );
  }
}