import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Participation",
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        )
      ],
    );
  }
}
