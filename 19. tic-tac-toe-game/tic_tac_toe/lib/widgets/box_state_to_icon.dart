import 'package:flutter/material.dart';

import '../enums/box_state.dart';

class BoxStateToIcon extends StatelessWidget {
  final boxState;
  const BoxStateToIcon({Key? key, required this.boxState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return boxState == BoxState.circle
        ? const Icon(Icons.lens_outlined, size: 100.0)
        : boxState == BoxState.cross
            ? const Icon(Icons.close, size: 120.0)
            : Container();
  }
}
