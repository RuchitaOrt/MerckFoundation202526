import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width for each gallery item ~ 80% of screen
    final itemWidth = screenWidth * 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "Alumni Testimonials",
          style: TextStyle(
             fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w800,
            color: Customcolor.text_blue,
          ),
        ),
        const SizedBox(height: 12),
SizedBox(
  height: 260,
  child: ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (_, index) {
      return SizedBox(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
  width: itemWidth,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  ),
  clipBehavior: Clip.antiAlias,
  child: Image.network(
    "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Dr. Rasha Kelej at Inauguration of Merck Foundation First Ladies Initiative - MFFLI Summit 2025",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Customcolor.colorblack,fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
SizedBox(height: 2,),
        Center(
          child: Container(
                    width: MediaQuery.of(context).size.width /3,
                    decoration: BoxDecoration(
                     border: BoxBorder.all(color: Colors.yellow.shade700,width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        child: Text(
                          "Watch More",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        )
      ],
    );
  }
}