import 'package:flutter/material.dart';

/// The original crop preserves underlines, tables and deliberately misspelled words.
class SourcePageView extends StatelessWidget {
  final List<String> images;
  final String label;
  const SourcePageView({super.key, required this.images, required this.label});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < images.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          Semantics(
            label: '$label. Büyütmek için dokunun.',
            button: true,
            child: InkWell(
              onTap: () => showDialog<void>(
                context: context,
                builder: (dialogContext) => Dialog.fullscreen(
                  child: Scaffold(
                    appBar: AppBar(title: Text(label)),
                    body: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 5,
                      child: Center(child: _buildImage(images[i])),
                    ),
                  ),
                ),
              ),
              child: Container(
                color: const Color(0xFFF8FAFC),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                alignment: Alignment.center,
                child: _buildImage(images[i]),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildImage(String path) {
    final cleanPath = path.startsWith('/') ? path.substring(1) : path;
    return Image.asset(
      path,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          cleanPath,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => Image.network(
            'assets/$cleanPath',
            fit: BoxFit.contain,
            errorBuilder: (c2, e2, s2) => Image.network(
              '/$cleanPath',
              fit: BoxFit.contain,
              errorBuilder: (c3, e3, s3) => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.broken_image_rounded, color: Colors.grey, size: 40),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
