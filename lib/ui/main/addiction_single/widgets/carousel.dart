//TODO: Make the carousel clickable not only scrollable
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final CarouselController _controller = CarouselController(initialItem: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView.weighted(
        controller: _controller,
        itemSnapping: true,
        flexWeights: const [3, 3, 1],
        children: widget.imageUrls.map((url) {
          return Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                height: double.infinity,
                child: Center(
                  child: Icon(Icons.image_not_supported),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
