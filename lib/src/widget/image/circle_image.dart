import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const defaultPlaceHolderColor = Colors.black26;

/// 丸画像を表示するウィジェット。
/// 画像 URL が null の場合には指定した代わりのアイコン
/// または丸いプレースホルダ画像を表示する。
class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.size,
    required this.imageURL,
    this.placeHolderColor = defaultPlaceHolderColor,
    this.showBorder = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  }) : super(key: key);

  final double size;
  final String? imageURL;
  final Color placeHolderColor;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    if ((imageURL ?? '').isEmpty) {
      return circlePlaceHolder(size: size);
    }
    return CachedNetworkImage(
      imageUrl: imageURL!,
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
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
      placeholder: (context, url) => circlePlaceHolder(size: size, color: placeHolderColor),
      errorWidget: (context, url, dynamic error) =>
          circlePlaceHolder(size: size, color: placeHolderColor),
    );
  }

  static Widget circlePlaceHolder({
    required double size,
    Color color = defaultPlaceHolderColor,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
