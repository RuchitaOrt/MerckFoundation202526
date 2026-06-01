// {
//   "success": true,
//   "message": "Data found",
//   "data": [
//     {
//       "id": 1,
//       "title": "Flutter"
//     }
//   ]
// }

// class ParentModel
// {
//   final bool? success;
//   final String? message;
//   final List<Data>? data;

//   ParentModel({
//    this.success,
//    this.message,
//    this.data
//   });

//   factory ParentModel.fromJson(Map<String,dynamic> json)
//   {
//     return ParentModel(
//       success: json['success'],
//       message: json['message'],
//       data: (json['data'] as List).map((e)=> Data.fromJson(e)).toList()
//     );
//   }
// }
// class Data{
//  final int? id;
//   final String? title;

//   Data({
//     this.id,
//     this.title
//   });

//   factory Data.fromJson(Map<String,dynamic> json)
//   {
//     return Data(id: json['id'],title:json[
//       'title'
//     ]);
//   }
// }