import 'package:flutter/material.dart';

///
class BigImageThreeLineContentsListItem extends StatelessWidget {
  ///
  final double itemHeight = 89.0;

  ///
  final double paddingVertical = 16.0;

  ///
  final double paddingLeft = 0.0;

  ///
  final double paddingRight = 16.0;

  ///
  final double paddingHorizontal = 16.0;

  ///
  final double gapInImageAndContent = 20.0;

  ///
  final double gapInContentAndButton = 16.0;

  ///
  final double contentHeight = 20.0;

  ///
  final double buttonSideLength = 24.0;

  ///
  final double imageWidth = 100.0;

  ///
  final double imageHeight = 56.0;

  ///
  final AssetImage image;

  ///
  final String title;

  ///
  final String content;

  ///
  final String subContent;

  ///
  final IconData icon;

  ///
  BigImageThreeLineContentsListItem(
      {this.image, this.title, this.content, this.subContent, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: itemHeight,
        padding: EdgeInsets.only(
            top: paddingHorizontal,
            bottom: paddingHorizontal,
            left: paddingLeft,
            right: paddingRight),
        child: Row(
          children: <Widget>[
            Container(
                width: imageWidth,
                height: imageHeight,
                margin: EdgeInsets.only(right: gapInImageAndContent),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(fit: BoxFit.cover, image: image))),
            Container(
                margin: EdgeInsets.only(right: gapInContentAndButton),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(alignment: Alignment.topLeft, child: Text(title)),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(content)),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: contentHeight, child: Text(subContent))),
                  ],
                )),
            Expanded(
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(icon),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {})))
          ],
        ));
  }
}
