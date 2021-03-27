import 'package:flutter/material.dart';

import '../play_ui.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;

  const LabelFieldWidget({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextWidget.fieldLabel(
        label,
      ),
    );
  }
}
