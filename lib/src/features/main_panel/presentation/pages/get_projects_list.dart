import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/project_card.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'ProjectsScreenRoute')
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GridTile> projectsCards;
    projectsCards = List.generate(
      10,
      (index) => GridTile(
        child: ProjectCard(
          color: Colors.amberAccent,
          openTasksCount: index,
          newTasksCount: index * 2,
          child: Text('Проект $index'),
        ),
      ),
    );

    // final authState = context.watch<AuthBloc>().state as AuthSuccess;
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

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (state as AuthSuccess).token,
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      AuthLogoutRequested(),
                                    );
                              },
                              icon: const Icon(Icons.logout_outlined),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Text('Всего задач:'),
                        //         Text('0'),
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Text('На сегодня:'),
                        //         Text('0'),
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Text('На неделю:'),
                        //         Text('0'),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Мои проекты',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverGrid.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      ...projectsCards,
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}