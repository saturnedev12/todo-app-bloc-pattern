import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/theme_bloc.dart';
import 'package:todolist/constantes.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/states/theme_states.dart';
import 'package:todolist/widgets/app_bar.dart';
import 'package:todolist/widgets/body.dart';
import 'package:todolist/widgets/floating_button.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/task_cubit.dart';

void main() async {
  var path = Directory.current.path;
  Hive.init(path);
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox('TASKS');
  await Hive.openBox("THEME");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<TaskCubit>(create: (_) => TaskCubit()),
      ],
      child: Builder(builder: (context) {
        context.read<ThemeBloc>().add(GetThemeEvent());
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'saturne todo',
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: Constantes.lightColorSchene,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: Constantes.darkColorSchene,
              ),
              themeMode:
                  (state is ThemeLightState) ? ThemeMode.light : ThemeMode.dark,
              home: TodoHomePage(),
            );
          },
        );
      }),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.box('TASKS').close();
    Hive.box("THEME").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: TodoAppBar(),
      body: SafeArea(child: TaskBody()),
      floatingActionButton: TodoFloatingButton(),
    );
  }
}
