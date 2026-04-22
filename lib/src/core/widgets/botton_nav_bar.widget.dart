import 'package:eventix/src/core/bloc/navigation.cubit.dart';
import 'package:eventix/src/core/views/em_construcao.view.dart';
import 'package:eventix/src/features/home/presentation/views/home.view.dart';
import 'package:eventix/src/core/views/perfil.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<String> _routes = ['/construcao', '/home', '/perfil'];
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            appBar: AppBar(title: const Text('Eventix'), centerTitle: true),
            drawer: Drawer(
              child: ListView(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerTheme: const DividerThemeData(
                        color: Colors.transparent,
                      ),
                    ),
                    child: DrawerHeader(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text('Drawer Header'),
                    ),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: const Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    ),
                    leading: const Icon(Icons.logout, color: Colors.red),
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                  ),
                ],
              ),
            ),
            body: Navigator(
              key: _navigatorKey,
              initialRoute: '/home',
              onGenerateRoute: (settings) {
                late Widget page;

                switch (settings.name) {
                  case '/home':
                    page = const HomeView();
                    break;
                  case '/construcao':
                    page = const EmConstrucaoView();
                    break;
                  case '/perfil':
                    page = const PerfilView();
                    break;
                  default:
                    page = const EmConstrucaoView();
                }

                return MaterialPageRoute(
                  builder: (_) => page,
                  settings: settings,
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                if (selectedIndex == index) return;
                context.read<NavigationCubit>().setIndex(index);
                _navigatorKey.currentState!.pushReplacementNamed(
                  _routes[index],
                );
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.build),
                  label: 'Construção',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Início',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
