import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/data/model/CommonModel.dart';

import '../Utils/customcolor.dart';

class ProgramProvider extends ChangeNotifier {
  final List<ProgramModel> _programs = [
    ProgramModel(
      id: 'mmtm',
      title: 'Merck Foundation "More Than a Mother" Movement',
      image: 'assets/programs/mmtm.png',
      bgColor: Customcolor.prog1,
    ),
    ProgramModel(
      id: 'cancer',
      title: 'Merck Foundation Cancer Access Program',
      image: 'assets/programs/cancer.png',
      bgColor: Customcolor.prog2,
    ),
    ProgramModel(
      id: 'capacity',
      title: 'Merck Foundation Capacity Advancement Program',
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog3,
    ),
     ProgramModel(
      id: 'Nationwide',
      title: 'Merck Foundation Nationwide Diabetes & Hypertension Blue Points Program',
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog7,
    ),
     ProgramModel(
      id: 'FirstLadies',
      title:  "Merck Foundation First Ladies Initiative Summit- MFFLI",
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog4,
    ),
     ProgramModel(
      id: 'STEM',
      title: "Merck Foundation STEM Program                  ",
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog5,
    ),
     ProgramModel(
      id: 'EducatingLinda',
      title:"Merck Foundation Educating Linda Program",
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog6,
    ),
     ProgramModel(
      id: 'Africa',
      title:"Merck Foundation Africa Asia Luminary      ",
      image: 'assets/programs/capacity.png',
      bgColor: Customcolor.prog8,
    ),
   
  ];

  List<ProgramModel> get programs => _programs;
}

   
