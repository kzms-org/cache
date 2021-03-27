import 'package:flutter/material.dart';

class HorizontalListViewWidget<T> extends StatefulWidget {
  List<T> list;
  IndexedWidgetBuilder itemBuilder;
  IndexedWidgetBuilder separatorBuilder;

  HorizontalListViewWidget({
    @required this.list,
    @required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  _HorizontalListViewWidgetState createState() =>
      _HorizontalListViewWidgetState();
}

class _HorizontalListViewWidgetState extends State<HorizontalListViewWidget> {
  List<Widget> _generateItemWidgets() {
    List<Widget> items = [];
    for (int i = 0; i < widget.list.length; i++) {
      items.add(widget.itemBuilder(context, i));
      if (widget.separatorBuilder != null) {
        items.add(widget.separatorBuilder(context, i));
      }
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateItemWidgets(),
      ),
    );
  }
}
