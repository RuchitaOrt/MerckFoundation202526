import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String getYoutubeThumbnail(String url) {
  final id = url.split('/').last;
  return "https://img.youtube.com/vi/$id/0.jpg";
}
class YouTubePreview extends StatelessWidget {
  final String videoId;

  const YouTubePreview({super.key, required this.videoId});

  Future<void> _openYoutube() async {
    final url = Uri.parse("https://www.youtube.com/watch?v=$videoId");
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: _openYoutube,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://img.youtube.com/vi/$videoId/0.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(14),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
