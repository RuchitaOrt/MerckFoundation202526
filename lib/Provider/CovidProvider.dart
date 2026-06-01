import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/CommonModel.dart';

class CovidProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Video> videos = [];
  List<Newsletter> news = [];
  List<Description> descriptions = [];

  Future<void> loadInitialData() async {
    isLoading = true;
    notifyListeners();
    news = [
      Newsletter(
        imge:
            "https://merck-foundation.com/merckfoundation/public/uploads/merck_media/1614855408_096ac4d715d3daaea5a6.jpg",
        title:
            "Merck Foundation announce ‘Stay at Home’ Media Recognition Awards…",
      ),
      Newsletter(
        imge:
            "https://lalai.com/demo/merck/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&lang=en&type=Files&currentFolder=%2F&hash=36d151d14dfb6a22&fileName=KNS_3249.jpg",
        title:
            "Message from Dr. Rasha Kelej on Community donations provided in…",
      ),
      Newsletter(
        imge:
            "https://merck-foundation.com/merckfoundation/public/uploads/newsletter/1613074147_50c0511266c18acc1b79.jpg",
        title:
            "Merck Foundation announce ‘Stay at Home’ Media Recognition Awards for…",
      ),
    ];
    descriptions = [
      Description(
        title: "Merck Foundation Community Support:",
        detail:
            "Merck Foundation partners with African First Ladies to support livelihood of thousands of women and casual workers affected by Coronavirus lockdown.",
      ),
      Description(
        title: "Merck Foundation Healthcare Capacity Building:",
        detail:
            "Merck Foundation started Coronavirus healthcare capacity building by providing online one-year diplomas and two-yea master’s degree in Respiratory Medicines and Acute Medicines for African Doctors",
      ),
      Description(
        title: "Merck Foundation Community Awareness through media Awards:",
        detail:
            "Merck Foundation announced, ‘Stay at Home’ Media Recognition Awards in Africa, Middle East, Asia & Latin America to raise awareness about Coronavirus.",
      ),
      Description(
        title: "Merck Foundation Community awareness for Children and Youth:",
        detail:
            "Merck Foundation launched an inspiring storybook ‘Making the Right Choice’ in partnership with African First Ladies to sensitize children and youth about Coronavirus",
      ),
    ];

    videos = [
      Video(
        videoLink: "https://www.youtube.com/embed/SvErYCf4Bz0",
        videoDesc: "Merck Foundation First Ladies Initiative - VC Summit 2020",
      ),
      Video(
        videoLink: "https://www.youtube.com/embed/xEY_PFyAHoY",
        videoDesc:
            "President of Liberia, H. E. MR. GEORGE WEAH created song to raise awareness about Corona virus",
      ),
      Video(
        videoLink: "https://www.youtube.com/embed/cUqvKZqJBik",
        videoDesc:
            "Merck Foundation in partnership with First Lady of Niger donate solidarity food kits in Niger",
      ),
      Video(
        videoLink: "https://www.youtube.com/embed/Xp77FvNMvkk",
        videoDesc:
            "Corona awareness video by the First Lady of Liberia, H. E. CLAIRE WEAH",
      ),
      Video(
        videoLink: "https://www.youtube.com/embed/tBcxh-w8sXQ",
        videoDesc:
            "H.E. MRS. FATOMATTOU BAH-BARROW raise awareness about Coronavirus prevention.",
      ),
      Video(
        videoLink: "https://www.youtube.com/embed/QcRCwEgDF5c",
        videoDesc:
            "“My White Army” Rasha Kelej ,11 Singers,11 Countries to support Coronavirus medical staff in Africa.",
      ),
    ];

    isLoading = false;
    notifyListeners();
  }
}
