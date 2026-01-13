import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/widgets/Customcard.dart';

final List<String> typewidet = [
  "videos",
  "ceo_msg",
  "episodes",
  "gallery",
  "Testimonial",
 
];
List<Widget> listofwiget = [];
List<Widget> list(BuildContext context) {
  listofwiget.clear();

  for (int i = 0; i < typewidet.length; i++) {
    /// ---------------- VIDEOS ----------------
    if (typewidet[i] == "videos") {
      listofwiget.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomCard(
            showYoutubeIcon: true,
            
            headerPrefix: "Hear Our ",
            title: "Stories",
            imageUrl:
                "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
            subtitle:
                "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
            buttonText: "Watch More",
            onCardTap: () {},
            onButtonTap: () {},
          ),
        ),
      );
    }

    /// ---------------- CEO MESSAGE ----------------
    if (typewidet[i] == "ceo_msg") {
      listofwiget.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomCard(
            showYoutubeIcon: false,
            headerPrefix: "Message From ",
            title: "Senator, Dr.Rasha Kelej, CEO of Merck Foundation ",
            imageUrl:
                "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764844054_cafe376d20d758ca18dd.jpg",
            subtitle:
                "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
            buttonText: "View More",
            onCardTap: () {},
            onButtonTap: () {},
          ),
        ),
      );
    }

    /// ---------------- GALLERY ----------------
    if (typewidet[i] == "gallery") {
      listofwiget.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomCard(
            showYoutubeIcon: false,
            headerPrefix: "Photo ",
            title: "Gallery",
            imageUrl:
                "https://merck-foundation.com/merckfoundation/public/uploads/gallery/1698904631_8be7e035d15fd6d4b188.jpeg",
            subtitle:
                "Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025 Dr. Rasha Kelej’s Speech at Merck Foundation Africa Asia Luminary 2025",
            buttonText: "View More",
            onCardTap: () {},
            onButtonTap: () {},
          ),
        ),
      );
    }
    if (typewidet[i] == "Testimonial") {
      listofwiget.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child:CustomCard(
  headerPrefix: "Alumini ",
  title: "Testimonials",
  imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
  subtitle: "Dr Adolphe MUHIRF, Rwanda",
  htmlSubtitle: "Merck Doundation Medical Oncology Fellowship | 2018 Merck Foundation Alimoni",
  buttonText: "View More",
 
  onCardTap: () => print("Card tapped"),
  onButtonTap: () => print("Button tapped"),
)
        ));
    }

    /// ---------------- EPISODES ----------------
    if (typewidet[i] == "episodes") {
      listofwiget.add(
        Padding(padding: const EdgeInsets.only(top: 8), child: CustomCard(
            
   headerPrefix: "Merck Foundation Presents \n",
              title: '"Our Africa By Merck Foundation" \n(TV Program)   ',
  imageUrl: "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",

  subtitle: "Merck Doundation Medical Oncology Fellowship | 2018 Merck Foundation Alimoni",
  buttonText: "Watch More",
 
  onCardTap: () => print("Card tapped"),
  onButtonTap: () => print("Button tapped"),
  showShareIcon
  :true,
  showInfoIcon: true,
            ),),
      );
    }
  }

  return listofwiget;
}
