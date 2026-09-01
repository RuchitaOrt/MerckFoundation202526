class EpisodeSeasonResponse {
  final List<EpisodeSeason> data;

  EpisodeSeasonResponse({
    required this.data,
  });

  factory EpisodeSeasonResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EpisodeSeasonResponse(
      data: json['data'] is List
          ? (json['data'] as List)
                .map((e) => EpisodeSeason.fromJson(e))
                .toList()
          : [],
    );
  }
}

class EpisodeSeason {
  final int id;
  final String seasonName;
  final String? seasonDescription;
  final int position;
  final List<EpisodeModel> episodes;

  EpisodeSeason({
    required this.id,
    required this.seasonName,
    this.seasonDescription,
    required this.position,
    required this.episodes,
  });

  factory EpisodeSeason.fromJson(
    Map<String, dynamic> json,
  ) {
    return EpisodeSeason(
      id: json['id'] ?? 0,

      seasonName:
          json['season_name']?.toString() ?? "",

      seasonDescription:
          json['season_description']?.toString(),

      position: json['position'] ?? 0,

      episodes: json['episodes'] is List
          ? (json['episodes'] as List)
                .map((e) => EpisodeModel.fromJson(e))
                .toList()
          : [],
    );
  }
}

class EpisodeModel {
  final int id;
  final String episodeName;
  final String videoLink;

  EpisodeModel({
    required this.id,
    required this.episodeName,
    required this.videoLink,
  });

  factory EpisodeModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return EpisodeModel(
      id: json['id'] ?? 0,

      episodeName:
          json['episode_name']?.toString() ?? "",

      videoLink:
          json['video_link']?.toString() ?? "",
    );
  }

  /// ✅ FOR HorizontalMediaSection
  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "title": episodeName,
      "thumbnail": videoLink,
      "description": "",
    };
  }
}