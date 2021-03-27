import 'package:flutter/material.dart';

import '../play_ui.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String label;
  final bool obscureText;

  const TextFieldWidget({
    Key key,
    this.onChanged,
    this.label = "",
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LabelFieldWidget(
          label: label,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyText1,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        )
      ],
    );
  }
}
