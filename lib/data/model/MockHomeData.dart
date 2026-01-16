// import 'package:merckfoundation_252026/data/model/CommonModel.dart';


// class MockHomeData {
//   static final callForApp = [
//     CarouselItem(
//       image:  "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
//       title: "Call for Applications – 2026",
//       onTap: () {
//         // open url / pdf later
//       },
//     ),
//     CarouselItem(
//       image:  "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
//       title: "Research Grant Program",
//     ),
//     CarouselItem(
//       image:  "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
//       title: "Research Grant Program",
//     ),
//   ];

//   static final digitalLibrary = [
//     CarouselItem(
//     image: "https://merck-foundation.com/merckfoundation/public/uploads/digital_library/1729230260_ea688d80cc765d205a2d.jpg",
//       title: "Women Health Research",
//     ),
//    CarouselItem(
//       image:  "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
//       title: "Research Grant Program",
//     ),CarouselItem(
//       image:  "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
//       title: "Research Grant Program",
//     ),
//   ];

//   static final mmtm = [
//     CarouselItem(
//       image: "https://merck-foundation.com/merckfoundation/public/uploads/gallery/H_E_Madam_ANGELINE_NDAYISHIMIYE_The_First_Lady_of_Republic_of_Burundi.jpg",
//       title: "More Than a Mother Ambassador",
//     ),
//     CarouselItem(
//       image: "https://merck-foundation.com/merckfoundation/public/uploads/gallery/H_E_Madam_ANGELINE_NDAYISHIMIYE_The_First_Lady_of_Republic_of_Burundi.jpg",
//       title: "MMTM Initiative",
//     ),
//       CarouselItem(
//       image: "https://merck-foundation.com/merckfoundation/public/uploads/gallery/H_E_Madam_ANGELINE_NDAYISHIMIYE_The_First_Lady_of_Republic_of_Burundi.jpg",
//       title: "MMTM Initiative",
//     ),
//   ];
// }
class MockHomeData {
  static List<Map<String, dynamic>> homeTabsApiResponse() {
    return [
      {
        "key": "callForApp",
        "title": "Call for Applications",
        "items": [
          {
            "image": "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "Call for Applications – 2026",
          },
          {
            "image": "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "Research Grant Program",
          },
        ]
      },
      {
        "key": "mmtm",
        "title": "Merck More Than a Mother",
        "items": [
          {
            "image": "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "MMTM Initiative",
          }
        ]
      },
      {
        "key": "digitalLibrary",
        "title": "Digital Library",
        "items": [
          {
            "image":"https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "Medical Education Resources",
          }
        ]
      }
    ];
  }
}
class MockProgramData {
  static List<Map<String, dynamic>> homeTabsApiResponse() {
    return [
     
      {
        "key": "mmtm",
        "title": "Merck More Than a Mother",
        "items": [
          {
            "image": "https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "MMTM Initiative",
          }
        ]
      },
      {
        "key": "digitalLibrary",
        "title": "Digital Library",
        "items": [
          {
            "image":"https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
            "title": "Medical Education Resources",
          }
        ]
      }
    ];
  }
}
