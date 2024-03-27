import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/common_widgets/base_header.dart';
import 'package:flutter_todo_app/src/common_widgets/main_title_text.dart';
import 'package:flutter_todo_app/src/common_widgets/horisontal_tab_menu.dart';

class TasksListHeaderWidget extends StatelessWidget {
  const TasksListHeaderWidget({
    super.key,
    required this.screenTitle,
  });

  final String screenTitle;

  @override
  Widget build(BuildContext context) {
    return BaseHeaderWidget(
      mainTitleTextWidget: MainTitleTextWidget(screenTitle: screenTitle),
      subTitleWidget: const HorisontalTabMenu(
        tabs: ['Проект 1', 'Проект 2', 'Проект 3'],
      ),
    );
  }
}
