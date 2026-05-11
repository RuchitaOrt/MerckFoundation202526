import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

class CustomSwiper extends StatefulWidget {
  final List items;
  final Function(int index)? onIndexChanged;

  const CustomSwiper({
    super.key,
    required this.items,
    this.onIndexChanged,
  });

  @override
  State<CustomSwiper> createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // 🔥 responsive for all devices
      child: Stack(
        children: [
          /// 🔥 PAGE VIEW
          PageView.builder(
            controller: _controller,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              currentIndex = index;

              /// 🔥 trigger pagination
              widget.onIndexChanged?.call(index);

              setState(() {});
            },
            itemBuilder: (context, index) {
              final item = widget.items[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: _SwiperCard(item: item),
              );
            },
          ),

          /// ⬅️ LEFT ARROW
          Positioned(
            left: 5,
            top: 0,
            bottom: 0,
            child: AnimatedOpacity(
              opacity: currentIndex > 0 ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: _arrowButton(
                icon: Icons.arrow_back_ios_new,
                onTap: () {
                  if (currentIndex > 0) {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ),

          /// ➡️ RIGHT ARROW
          Positioned(
            right: 5,
            top: 0,
            bottom: 0,
            child: AnimatedOpacity(
              opacity:
                  currentIndex < widget.items.length - 1 ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: _arrowButton(
                icon: Icons.arrow_forward_ios,
                onTap: () {
                  if (currentIndex < widget.items.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 Arrow Button UI
  Widget _arrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

/// 🔥 CARD UI
class _SwiperCard extends StatelessWidget {
  final dynamic item;

  const _SwiperCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        /// 🔹 IMAGE
        Expanded(
          child: GestureDetector(
            onTap: ()
            {
              ShowDialogs.launchURL(item.pdfFile);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: (item.image != null &&
                        item.image.toString().isNotEmpty)
                    ? FadeInImage.assetNetwork(
                        placeholder: CommonImagePath.placeHolder,
                        image: item.image,
                        fit: BoxFit.cover,
            
                        /// 🔥 ERROR HANDLING
                        imageErrorBuilder: (_, __, ___) => Image.asset(
                          CommonImagePath.placeHolder,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        CommonImagePath.placeHolder,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        /// 🔹 TITLE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            item.title ?? "",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: width * 0.035, // 🔥 responsive text
              fontWeight: FontWeight.w700,
              color: Customcolor.pink_col,
            ),
          ),
        ),
      ],
    );
  }
}