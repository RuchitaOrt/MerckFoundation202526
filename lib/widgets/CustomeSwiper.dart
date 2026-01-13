import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class CustomSwiper extends StatefulWidget {
  final List<CallApplicationModel> items;

  const CustomSwiper({super.key, required this.items});

  @override
  State<CustomSwiper> createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  final PageController _controller = PageController(viewportFraction: 0.75);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => _SwiperCard(
              model: widget.items[i],
              active: i == _index,
            ),
          ),
        ),

        DotsIndicator(
          dotsCount: widget.items.length,
          position: _index.toDouble(),
          decorator: DotsDecorator(
            activeColor: Customcolor.pink_col,
            color: Customcolor.ligthpink,
          ),
        ),

         8.0.heightBox,

        Text(
          widget.items[_index].title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
class _SwiperCard extends StatelessWidget {
  final CallApplicationModel model;
  final bool active;

  const _SwiperCard({required this.model, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: active ? 0 : 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage.assetNetwork(
          placeholder: CommonImagePath.placeHolder,
          image: model.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
