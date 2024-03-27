import 'package:flutter/material.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_header.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/common_widgets/gap.dart';
import 'package:flutter_todo_app/src/common_widgets/main_title_text.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:intl/intl.dart';

class OneTaskScreen extends StatelessWidget {
  const OneTaskScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: BaseScreen(
        headerContainerWidget: BaseHeaderWidget(
          mainTitleTextWidget: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: MainTitleTextWidget(screenTitle: S.of(context).taskDetails),
          ),
          subTitleWidget: null,
        ),
        bodyWidget: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Gap(size: kGapSizeVertical),
            MainTitleTextWidget(screenTitle: task.title),
            const Gap(size: kGapSizeVertical),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Text('Задача создана',
                        style: Theme.of(context).textTheme.labelSmall),
                    Text(
                      DateFormat('dd MMMM yyyy').format(task.createdDate),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Срок выполнения',
                        style: Theme.of(context).textTheme.labelSmall),
                    Text(
                        task.deadlineDate != null
                            ? DateFormat('dd MMMM yyyy')
                                .format(task.deadlineDate!)
                            : '',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
            const Gap(size: kGapSizeVertical),
            Text(task.description),
            const Divider(),
            const Gap(size: kGapSizeVertical),
            Wrap(
              spacing: kGapSizeVertical,
              runSpacing: kGapSizeVertical,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/cover.jpg'),
                        radius: 20,
                        child: Text('U'),
                      ),
                      Text('Username'),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            const Gap(size: kGapSizeVertical),
            const Text('Комментарии'),
          ],
        ),
      ),
    );
  }
}
