import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_header.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/common_widgets/main_title_text.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_todo_app/src/common_widgets/horisontal_tab_menu.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list.dart';

@RoutePage(name: 'ProjectsScreenRoute')
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.router.popUntilRouteWithPath('/');
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return BaseScreen(
          headerContainerWidget: BaseHeaderWidget(
            mainTitleTextWidget: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Text(
                (state as AuthSuccess).token,
              ),
              title: MainTitleTextWidget(screenTitle: S.of(context).tasks),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLogoutRequested(),
                        );
                  },
                  icon: const Icon(Icons.logout),
                )
              ],
            ),
            subTitleWidget: const HorisontalTabMenu(
              tabs: ['Все', 'Активные', 'Завершенные'],
            ),
          ),
          bodyWidget: const TaskList(),
        );
      },
    );
  }
}
