import 'package:flutter/material.dart';

///
class MaterialListViewItem extends StatefulWidget {
  ///
  final ListViewItemData _listViewItemData;

  ///
  MaterialListViewItem(this._listViewItemData);

  ///
  @override
  State<StatefulWidget> createState() {
    return _MaterialListViewItemState(_listViewItemData);
  }
}

class _MaterialListViewItemState extends State<MaterialListViewItem> {
  ///
  double _itemHeight;

  ///
  double _imagePaddingTop;

  ///
  double _imagePaddingBottom;

  ///
  double _imageWidth;

  ///
  double _imageHeight;

  ///
  double _gapInImageAndContent;

  ///
  double _gapInContentAndButton;

  ///
  double _contentHeight;

  ///
  double _titleHeight;

  ///
  double _actionWidgePaddingTop;

  ///
  double _actionWidgePaddingBottom;

  ///
  double _actionWidgePaddingRight;

  ///
  double _actionWidgeSideLength;

  ///
  double _titleSize;

  ///
  double _contentSize;

  ///
  final ListViewItemData _listViewItemData;

  ///
  _MaterialListViewItemState(this._listViewItemData) {
    if (_listViewItemData.itemType == ListViewTypes.threeLine) {
      _itemHeight = 88.0;
      _imagePaddingTop = 16.0;
      _imagePaddingBottom = 16.0;
      _imageWidth = 100.0;
      _imageHeight = 56.0;
      _gapInImageAndContent = 20.0;
      _gapInContentAndButton = 16.0;
      _titleHeight = 28.0;
      _contentHeight = 20.0;
      _actionWidgePaddingTop = 16.0;
      _actionWidgePaddingBottom = 16.0;
      _actionWidgePaddingRight = 16.0;
      _actionWidgeSideLength = 24.0;
      _titleSize = 16;
      _contentSize = 14;
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: _itemHeight,
          padding: EdgeInsets.only(
              top: _imagePaddingTop,
              bottom: _imagePaddingBottom,
              right: _gapInImageAndContent),
          child: Container(
              width: _imageWidth,
              height: _imageHeight,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: _listViewItemData.image))),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(right: _gapInContentAndButton),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: _titleHeight,
                child: Text(
                  _listViewItemData.title,
                  style: TextStyle(fontSize: _titleSize),
                  maxLines: 1,
                )),
            Container(
                height: _contentHeight,
                child: Text(
                  _listViewItemData.content,
                  style:
                      TextStyle(fontSize: _contentSize, color: Colors.black54),
                  maxLines: 1,
                )),
            Container(
                height: _contentHeight,
                child: Text(
                  _listViewItemData.subContent,
                  style:
                      TextStyle(fontSize: _contentSize, color: Colors.black54),
                  maxLines: 1,
                ))
          ]),
        )),
        Container(
          padding: EdgeInsets.only(
              top: _actionWidgePaddingTop,
              right: _actionWidgePaddingRight,
              bottom: _actionWidgePaddingBottom),
          child: Container(
              width: _actionWidgeSideLength,
              height: _actionWidgeSideLength,
              child: Align(
                alignment: Alignment.topRight,
                child: _listViewItemData.actionWidget,
              )),
        ),
      ],
    );
  }
}

///
enum ListViewTypes { oneLine, twoLine, threeLine }

///
class ListViewItemData {
  ///
  AssetImage _image;

  ///
  String _title;

  ///
  String _content;

  ///
  String _subContent;

  ///
  Widget _actionWidget;

  ///
  ListViewTypes _itemType;

  ///
  ListViewItemData(this._itemType, this._title,
      {image, content, subContent, actionWidget, itemType}) {
    _image = image;
    _content = content;
    _subContent = subContent;
    _actionWidget = actionWidget;
  }

  ///
  AssetImage get image => _image;

  ///
  set image(AssetImage value) {
    _image = value;
  }

  ///
  String get title => _title;

  ///
  set title(String value) {
    _title = value;
  }

  ///
  String get content => _content;

  ///
  set content(String value) {
    _content = value;
  }

  ///
  String get subContent => _subContent;

  ///
  set subContent(String value) {
    _subContent = value;
  }

  ///
  Widget get actionWidget => _actionWidget;

  ///
  set actionWidget(Widget value) {
    _actionWidget = value;
  }

  ///
  ListViewTypes get itemType => _itemType;

  ///
  set itemType(ListViewTypes value) {
    _itemType = value;
  }
}
