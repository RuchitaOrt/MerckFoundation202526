class SocialMediaResponse {
  final List<SocialMediaData>? data;
  final ResponseData? response;

  SocialMediaResponse({
    this.data,
    this.response,
  });

  factory SocialMediaResponse.fromJson(Map<String, dynamic> json) {
    return SocialMediaResponse(
      data: (json['data'] as List?)
          ?.map((e) => SocialMediaData.fromJson(e))
          .toList(),
      response: json['response'] != null
          ? ResponseData.fromJson(json['response'])
          : null,
    );
  }
}

class SocialMediaData {
  final int? id;
  final String? socialMediaTypeName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final bool? isActive;
  final String? deletedBy;
  final DateTime? deletedAt;
  final String? viewedBy;
  final DateTime? viewedAt;
  final int? categoryId;
  final int? socialMediaTypeId;
  final String? socialMediaLink;
  final bool? status;

  SocialMediaData({
    this.id,
    this.socialMediaTypeName,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.isActive,
    this.deletedBy,
    this.deletedAt,
    this.viewedBy,
    this.viewedAt,
    this.categoryId,
    this.socialMediaTypeId,
    this.socialMediaLink,
    this.status,
  });

  factory SocialMediaData.fromJson(Map<String, dynamic> json) {
    return SocialMediaData(
      id: json['id'],
      socialMediaTypeName: json['social_media_type_name'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      isActive: json['isActive'],
      deletedBy: json['deletedBy'],
      deletedAt: json['deletedAt'] != null
          ? DateTime.tryParse(json['deletedAt'])
          : null,
      viewedBy: json['viewedBy'],
      viewedAt: json['viewedAt'] != null
          ? DateTime.tryParse(json['viewedAt'])
          : null,
      categoryId: json['category_id'],
      socialMediaTypeId: json['social_media_type_id'],
      socialMediaLink: json['social_media_link'],
      status: json['status'],
    );
  }
}

class ResponseData {
  final int? n;
  final String? msg;
  final String? status;

  ResponseData({
    this.n,
    this.msg,
    this.status,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      n: json['n'],
      msg: json['msg'],
      status: json['status'],
    );
  }
}