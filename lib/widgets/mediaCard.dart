import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/screens/EpisodeScreen/EpisodeInformation.dart';
import 'package:merckfoundation_252026/widgets/CommonPopupMenu.dart';
import 'package:merckfoundation_252026/widgets/PauseImage.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
class MediaCard extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final VoidCallback? onTap;
  final bool showPlayIcon;
  final Color fontColor;
  final bool showmenu;

  const MediaCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.showPlayIcon = false,
    this.fontColor = Colors.black87,
    this.showmenu=false, required this.id
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(6), // 🔥 spacing between cards
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // smoother radius
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            /// IMAGE
            Expanded(
              flex: 2, // 🔥 give more space to image
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 10), // 🔥 equal padding
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,

                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },

                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            child:Image.asset(CommonImagePath.placeHolder, width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,)
                          );
                        },
                      ),
                    ),
                  ),
                  if(showmenu)
                  Positioned(
  top: 16,
  right: 12,
  child: Container(
    
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.45),
      shape: BoxShape.circle,
    ),
    child: CommonPopupMenu(
  iconcolor: Colors.white,
      onSelected: (value) {
        print("SELECTED");
        print(value);
        if(value=="More Info")
        {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  EpisodeInformation(episodeid:id ,),
                    ),
                  );
          
        }
      },
    ),
  ),
),

                  if (showPlayIcon) const PauseImage(),
                ],
              ),
            ),

            /// TEXT
           Expanded(
  flex: 1,
  child: Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 6,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // 🔥 vertical center
      crossAxisAlignment: CrossAxisAlignment.start, // optional
      children: [
        FormLabel(
          text: title,
          maxLines: 3,
          textAlignment: TextAlign.center,
          fontSize: screenWidth * 0.030,
          labelColor: fontColor,
          fontweight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
