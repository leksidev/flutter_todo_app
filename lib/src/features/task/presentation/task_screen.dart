import 'package:flutter/material.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
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
        headerContainerHeight: MediaQuery.of(context).size.height * 0.12,
        headerContainerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: MainTitleTextWidget(screenTitle: S.of(context).taskDetails),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Gap(size: kGapSizeVertical),
            MainTitleTextWidget(screenTitle: task.title),
            const Gap(size: kGapSizeVertical),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {0: FlexColumnWidth(1.0)},
              border: TableBorder.all(width: 0, color: Colors.transparent),
              children: [
                TableRow(
                  children: [
                    const TableCell(
                      child: Text('Задача создана'),
                    ),
                    TableCell(
                      child: Text(
                        DateFormat('dd MMMM yyyy').format(task.createdDate),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Text('Постановщик'),
                    ),
                    TableCell(
                      child: Text(
                        task.id.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Text('Статус'),
                    ),
                    TableCell(
                      child: Text(
                        'В работе',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Text('Проект'),
                    ),
                    TableCell(
                      child: Text(
                        'Project name',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(size: kGapSizeVertical),
            Text(task.description),
            const Divider(),
            const Gap(size: kGapSizeVertical),
            const Wrap(
              spacing: kGapSizeVertical,
              runSpacing: kGapSizeVertical,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cover.jpg'),
                  radius: 20,
                  child: Text('U'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cover.jpg'),
                  radius: 20,
                  child: Text('U'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cover.jpg'),
                  radius: 20,
                  child: Text('U'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cover.jpg'),
                  radius: 20,
                  child: Text('U'),
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
