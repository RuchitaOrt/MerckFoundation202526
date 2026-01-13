import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

class ArticlesProvider extends ChangeNotifier {
  final List<ArticleModel> _articles = [];
 

  List<ArticleModel> get articles => _articles;


  Future<void> loadInitial() async {
   

    _articles.addAll(List.generate(
      10,
      (i) => ArticleModel(
        id: '$i',
        titleHtml: "<p>Merck Foundation Chairman and CEO together with African First Ladies released “Ray of Hope” children storybook and Animation Film for Cancer Awareness in three languages Merck Foundation Chairman and CEO together with African First Ladies released “Ray of Hope” children storybook and Animation Film for Cancer Awareness in three languages<b>$i</b></p>",
        imageUrl:  "https://merck-foundation.com/merckfoundation/public/uploads/testimonials/1693978262_463d0ee859a8dbd5e7c8.jpg",
      ),
    ));

   
  }
}
