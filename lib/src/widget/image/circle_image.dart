import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const defaultPlaceHolderColor = Colors.black26;

/// 丸画像を表示するウィジェット。
/// 画像 URL が null の場合には指定した代わりのアイコン
/// または丸いプレースホルダ画像を表示する。
class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.radius,
    required this.imageURL,
    this.placeHolderColor = defaultPlaceHolderColor,
    this.showBorder = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  }) : super(key: key);

  final double radius;
  final String? imageURL;
  final Color placeHolderColor;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    if ((imageURL ?? '').isEmpty) {
      return circlePlaceHolder(radius: radius);
    }
    return CachedNetworkImage(
      imageUrl: imageURL!,
      imageBuilder: (context, imageProvider) => Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
          border: showBorder
              ? Border.all(
                  color: borderColor,
                  width: borderWidth,
                )
              : null,
        ),
      ),
      placeholder: (context, url) => circlePlaceHolder(radius: radius, color: placeHolderColor),
      errorWidget: (context, url, dynamic error) =>
          circlePlaceHolder(radius: radius, color: placeHolderColor),
    );
  }

  static Widget circlePlaceHolder({
    required double radius,
    Color color = defaultPlaceHolderColor,
  }) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
