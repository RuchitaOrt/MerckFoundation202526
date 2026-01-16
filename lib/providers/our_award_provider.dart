import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class OurAwardProvider extends ChangeNotifier {
  final List<AwardModel> _awards = [
    AwardModel(
      id: "1",
      title: "Merck Foundation MEDIA RECOGNITION AWARDS “More Than a Mother”",
      description:
          "Merck Foundation MEDIA RECOGNITION AWARDS “More Than a Mother”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+1",
      pageUrl: "award-1",
    ),
    AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation FILM AWARDS “More Than a Mother”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ),
     AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation FASHION AWARDS “More Than a Mother”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ),
     AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation SONG Awards “More Than a Mother”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ),

     AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation MEDIA RECOGNITION AWARDS “Diabetes & Hypertension”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ),

     AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation FILM AWARDS “Diabetes & Hypertension”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ), AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation SONG AWARDS “Diabetes & Hypertension”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ), AwardModel(
      id: "2",
      title: "Merck More Than A Mother Awards",
      description:
          "Merck Foundation FASHION AWARDS “Diabetes & Hypertension”",
      imageUrl:
          "https://via.placeholder.com/400x200.png?text=Award+2",
      pageUrl: "award-2",
    ),
  ];

  List<AwardModel> get awards => _awards;
}
