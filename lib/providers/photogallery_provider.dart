
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class PhotoGalleryProvider extends ChangeNotifier {
  final List<StoryModel> _stories = [];

  List<MediaCardData> get cards =>
      _stories.map((story) {
        return MediaCardData(
        
          image: story.videoLink,
          title: story.description,
          onTap: () {
            // navigate to story detail

            
          },
        );
      }).toList();

   void loadStaticdigitalLibrary() {
    _stories.addAll([
     StoryModel(
      
      videoLink:"https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764843155_87123fe126167563bdf4.jpg",
      description: "2025",
    ),
    StoryModel(
      videoLink:  "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "2024",
    ),
     StoryModel(
      videoLink: "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1757503943_47d91b1cf647be437d9b.jpg",
      description: "2023",
    ),
    StoryModel(
      videoLink: "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "2022",
    ),
    StoryModel(
      videoLink:  "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "2017",
    ),
     StoryModel(
      videoLink:"https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "Empowering women through education Empowering women through education",
    ),
    StoryModel(
      videoLink:  "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "Healthcare initiatives across Africa",
    ),
    ]);
    notifyListeners();
  }
}
