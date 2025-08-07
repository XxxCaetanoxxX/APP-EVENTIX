import 'package:eventix/main.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/logout.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/login.bloc.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/logout.state.dart';
import 'package:eventix/src/features/login/presentation/views/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LoginBloc _bloc = sl<LoginBloc>();
  final Box _box = sl<Box>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<LoginBloc, BaseState>(
        listener: (context, state) async {
          if (state is LogOutState) {
            print('sem token'); 
            print(_box.get('token')); 

            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Home')),
          drawer: Drawer(
            child: ListView(
              children: [
                //remove divider
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerTheme: const DividerThemeData(
                      color: Colors.transparent,
                    ),
                  ),
                  child: DrawerHeader(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text('Drawer Header'),
                  ),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    print('token');
                    print(_box.get('token'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: Icon(Icons.logout, color: Colors.red),
                  onTap: () {
                    _bloc.add(LogOutEvent());
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(child: const Center(child: Text('Home'))),
        ),
      ),
    );
  }
}
