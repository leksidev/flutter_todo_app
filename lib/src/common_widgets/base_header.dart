import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/common_widgets/gap.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';

class BaseHeaderWidget extends StatelessWidget {
  const BaseHeaderWidget({
    super.key,
    required this.mainTitleTextWidget,
    required this.subTitleWidget,
  });

  final Widget mainTitleTextWidget;
  final Widget? subTitleWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        mainTitleTextWidget,
        const Gap(
          size: 20,
        ),
        subTitleWidget ??
            const Gap(
              size: kGapSizeVertical,
            )
      ],
    );
  }
}
