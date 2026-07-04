import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonFunctions.dart';

class ImagePreviewDialog extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ImagePreviewDialog({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Close Button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          /// Zoomable Image
          Expanded(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (
                  context,
                  child,
                  loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 80,
                  );
                },
              ),
            ),
          ),

          /// Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Text(
                stripHtml(title),
              // title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}