import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

export 'package:carousel_slider/carousel_slider.dart';

/// 图片轮播
class ImageBanner extends StatefulWidget {
  /// 组件高度
  final double height;

  /// 图片资源
  final List<String> imgUrlList;

  /// 图片BoxFit
  final BoxFit fit;

  /// 圆角
  final double? radius;

  /// 是否自动播放
  final bool autoPlay;

  /// 自动播放间隔
  final Duration autoPlayInterval;

  /// 播放时长
  final Duration autoPlayAnimationDuration;

  /// 加载图片时，加载中的组件
  final Widget? placeholder;

  /// 加载图片时，加载失败的组件
  final Widget errorWidget;

  /// 控制器
  final CarouselSliderController? controller;

  /// 页码指示器
  /// 默认实现：[DefaultCirclePagination]
  /// 可选配置：[DefaultCirclePagination]/[DefaultRoundedPagination]
  final Widget Function(CarouselSliderController controller, int index, bool isSelected)? paginationBuilder;

  /// 点击轮播页
  final void Function(int index)? onTap;

  final int? cacheWidth;
  final int? cacheHeight;

  /// 监听页面切换
  final Function(int index)? onPageChanged;

  const ImageBanner({
    super.key,
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
    this.onTap,
    this.cacheWidth,
    this.cacheHeight,
    this.onPageChanged,
  });

  @override
  State<ImageBanner> createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  int _current = 0;

  CarouselSliderController? _controller;

  CarouselSliderController get _effectiveController {
    return widget.controller ?? _controller!;
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = CarouselSliderController();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imgUrlList.isEmpty) {
      return const SizedBox.shrink(); // 返回一个占位符
    }

    Widget child = CarouselSlider(
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
          if (widget.onPageChanged != null) {
            widget.onPageChanged!(index);
          }
        },
      ),
      items: widget.imgUrlList.mapIndexed((index, item) {
        Widget current = Container(
          color: Colors.grey[200],
          child: CachedNetworkImage(
            imageUrl: item,
            height: widget.height,
            width: double.infinity,
            fit: widget.fit,
            placeholder: widget.placeholder == null ? null : ((context, url) => widget.placeholder!),
            errorWidget: (context, url, error) => widget.errorWidget,
            memCacheWidth: widget.cacheWidth,
            memCacheHeight: widget.cacheHeight,
            imageRenderMethodForWeb: UniversalPlatform.isWeb ? ImageRenderMethodForWeb.HttpGet : ImageRenderMethodForWeb.HtmlImage,
          ),
        );

        return GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(index);
            }
          },
          child: current,
        );
      }).toList(),
    );

    if (widget.radius != null) {
      child = ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.radius!),
        ),
        child: child,
      );
    }

    return RepaintBoundary(
      child: Stack(
        children: [
          child,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgUrlList.asMap().entries.map((entry) {
                Widget? child;
                if (widget.paginationBuilder != null) {
                  child = widget.paginationBuilder!(_effectiveController, entry.key, _current == entry.key);
                }

                child ??= DefaultCirclePagination(
                  isSelected: _current == entry.key,
                );

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _effectiveController.animateToPage(entry.key),
                  child: child,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 默认实现的圆形的页码指示器
class DefaultCirclePagination extends StatelessWidget {
  final bool isSelected;
  final Color? selectedPaginationColor;
  final Color? unSelectedPaginationColor;

  const DefaultCirclePagination({
    super.key,
    required this.isSelected,
    this.selectedPaginationColor,
    this.unSelectedPaginationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? selectedPaginationColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withValues(alpha: 0.9)
            : unSelectedPaginationColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withValues(alpha: 0.4),
      ),
    );
  }
}

/// 默认实现的圆角的页码指示器
class DefaultRoundedPagination extends StatelessWidget {
  final bool isSelected;
  final Color? selectedPaginationColor;
  final Color? unSelectedPaginationColor;

  const DefaultRoundedPagination({
    super.key,
    required this.isSelected,
    this.selectedPaginationColor,
    this.unSelectedPaginationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? selectedPaginationColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withValues(alpha: 0.9)
            : unSelectedPaginationColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withValues(alpha: 0.4),
      ),
    );
  }
}
