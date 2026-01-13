
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/screens/WhatWeDoScreen.dart/ourActivitiesDetail.dart';

class OurActivityProvider extends ChangeNotifier {
  final List<StoryModel> _stories = [];

  List<MediaCardData> get cards =>
      _stories.map((story) {
        return MediaCardData(
        showPlayIcon: false,
          image: story.videoLink,
          title: story.description,
          onTap: () {
            // navigate to story detail

             Navigator.push(
                                routeGlobalKey.currentContext!,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ourActivitiesDetail()));
          },
        );
      }).toList();

  void loadStaticStories() {
    _stories.addAll([
     StoryModel(
      
      videoLink:"https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764843155_87123fe126167563bdf4.jpg",
      description: "Empowering women through education Empowering women through education",
    ),
    StoryModel(
      videoLink:  "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "Healthcare initiatives across Africa Healthcare initiatives across Africa Healthcare initiatives across Africa Healthcare initiatives across Africa",
    ),
     StoryModel(
      videoLink: "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1757503943_47d91b1cf647be437d9b.jpg",
      description: "Empowering women through education Empowering women through education",
    ),
    StoryModel(
      videoLink: "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "Healthcare initiatives across Africa",
    ),
    StoryModel(
      videoLink:  "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1764143797_860be2b34f7c551427ef.jpg",
      description: "Healthcare initiatives across Africa",
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
