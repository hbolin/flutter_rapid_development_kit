import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
export 'package:carousel_slider/carousel_slider.dart';

/// 图片轮播
class ImageBanner extends StatefulWidget {
  final double height;
  final List<String> imgUrlList;
  final BoxFit fit;
  final double? radius;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final Widget? placeholder;
  final Widget errorWidget;
  final CarouselController? controller;
  final Widget Function(CarouselController controller, int index, bool isSelected)? paginationBuilder;

  const ImageBanner({
    Key? key,
    required this.height,
    required this.imgUrlList,
    this.fit = BoxFit.cover,
    this.radius,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.placeholder,
    this.errorWidget = const SizedBox.shrink(),
    this.controller,
    this.paginationBuilder,
  }) : super(key: key);

  @override
  State<ImageBanner> createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  int _current = 0;

  CarouselController? _controller;

  CarouselController get _effectiveController {
    return widget.controller ?? _controller!;
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = CarouselController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _effectiveController,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,
            autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.imgUrlList.map((item) {
            Widget current = Container(
              color: Colors.grey[200],
              child: CachedNetworkImage(
                imageUrl: item,
                height: widget.height,
                width: double.infinity,
                fit: widget.fit,
                placeholder: widget.placeholder == null ? null : ((context, url) => widget.placeholder!),
                errorWidget: (context, url, error) => widget.errorWidget,
              ),
            );

            if (widget.radius != null) {
              current = ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius!),
                ),
                child: current,
              );
            }

            return current;
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgUrlList.asMap().entries.map((entry) {
              if (widget.paginationBuilder != null) {
                return widget.paginationBuilder!(_effectiveController, entry.key, _current == entry.key);
              }
              return GestureDetector(
                onTap: () => _effectiveController.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
