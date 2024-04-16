import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list.dart';

@RoutePage(name: 'MainTasksScreenRoute')
class MainTasksScreen extends StatelessWidget {
  const MainTasksScreen({super.key});

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

        return DefaultTabController(
          length: 3,
          child: BaseScreen(
            headerContainerHeight: MediaQuery.of(context).size.height * 0.15,
            headerContainerWidget: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      (state as AuthSuccess).token,
                    ),
                  ),
                ),
              ),
              title: Text(
                S.of(context).tasks,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLogoutRequested(),
                        );
                  },
                  icon: const Icon(Icons.logout_outlined),
                )
              ],
              bottom: TabBar(
                physics: const BouncingScrollPhysics(),
                // splashFactory: NoSplash.splashFactory,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                indicatorWeight: 4.0,
                tabAlignment: TabAlignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                tabs: [
                  Tab(text: 'Все задачи'),
                  Tab(text: 'В работе'),
                  Tab(text: 'Выполненные'),
                ],
              ),
            ),
            bodyWidget: const TabBarView(
              children: [
                TaskList(),
                Icon(Icons.directions_car),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        );
      },
    );
  }
}
