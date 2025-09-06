import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        CrossAxisAlignment,
        EdgeInsets,
        Theme,
        Text,
        Padding,
        BorderRadius,
        RoundedRectangleBorder,
        Column,
        Card;

Widget buildsection(BuildContext context, String title, List<Widget> children) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
      Column(children: children),
    ],
  );
}
