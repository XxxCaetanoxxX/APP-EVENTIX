import 'package:eventix/src/core/bloc/navigation.cubit.dart';
import 'package:eventix/src/core/views/em_construcao.view.dart';
import 'package:eventix/home.view.dart';
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
              onTap: (index){
                if(selectedIndex == index) return;
                context.read<NavigationCubit>().setIndex(index);
                _navigatorKey.currentState!.pushReplacementNamed(_routes[index]);
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
