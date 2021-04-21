import 'package:flutter/material.dart';
import 'package:cache/play_ui/text_widget/text_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final bool centralize;
  final bool hideAppBar;
  final bool hideBackButton;
  final Widget bottomNavigationBar;

  const PageScaffoldWidget({
    Key key,
    this.child,
    this.title,
    this.centralize = false,
    this.hideAppBar = false,
    this.hideBackButton = false,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      appBar: hideAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              leading: hideBackButton
                  ? null
                  : IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        if (Navigator.canPop(context)) {Modular.to.pop();}
                        else{ print("cannot pop"); }
                      },
                    ),
              elevation: 0,
              title: title == null ? null : TextWidget.appBarTitle(title),
            ),
      body: centralize
          ? Center(
              child: SingleChildScrollView(
                child: child,
              ),
            )
          : SingleChildScrollView(
              child: child,
            ),
    );
  }
}
