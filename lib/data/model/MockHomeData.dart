
import 'package:merckfoundation_252026/enum/commonEnum.dart';

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
  static List<Map<String, dynamic>> homeTabsApiResponse(ProgramType type) {
   
    switch (type) {
      case ProgramType.mtm:
        return[
     
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

      case ProgramType.strategy:
        return [
     
    
      // {
      //   "key": "digitalLibrary",
      //   "title": "Digital Library",
      //   "items": [
      //     {
      //       "image":"https://merck-foundation.com/merckfoundation/public/uploads/news_and_applications/1751618748_389221cd265916300a3a.jpg",
      //       "title": "Medical Education Resources",
      //     }
      //   ]
      // }
    ];

      default:
        return [];
    }
   
  
  }
  
}
