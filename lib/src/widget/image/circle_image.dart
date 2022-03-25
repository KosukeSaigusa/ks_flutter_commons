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
      return CirclePlaceHolder(size: size, placeHolderColor: placeHolderColor);
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
      placeholder: (context, url) =>
          CirclePlaceHolder(size: size, placeHolderColor: placeHolderColor),
      errorWidget: (context, url, dynamic error) =>
          CirclePlaceHolder(size: size, placeHolderColor: placeHolderColor),
    );
  }
}

class CirclePlaceHolder extends StatelessWidget {
  const CirclePlaceHolder({
    required this.size,
    this.placeHolderColor = defaultPlaceHolderColor,
  });

  final double size;
  final Color placeHolderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: placeHolderColor,
      ),
    );
  }
}
