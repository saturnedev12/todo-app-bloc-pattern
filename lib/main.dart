import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/theme_bloc.dart';
import 'package:todolist/constantes.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/states/theme_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
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
      ),
    );
  }
}

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        elevation: 0,
        leadingWidth: 200,
        leading: Center(
            child: Text(
          "Saturne Todos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        )),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    (state is ThemeLightState)
                        ? context.read<ThemeBloc>().add(ThemeDarkEvent())
                        : context.read<ThemeBloc>().add(ThemeLightEvent());
                  },
                  icon: (state is ThemeLightState)
                      ? Icon(
                          Icons.brightness_2,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : Icon(
                          Icons.brightness_high,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        onPressed: () {
          showAddForm(context);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

void showAddForm(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10,
            right: 10,
            top: 10,
          ),
        );
      });
}
