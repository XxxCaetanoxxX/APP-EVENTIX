import 'package:eventix/src/features/login/presentation/views/login.view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            //remove divider
            Theme(
              data: Theme.of(context).copyWith(
                dividerTheme: const DividerThemeData(color: Colors.transparent),
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
              title: const Text('Sair', style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.logout, color: Colors.red),
              onTap: () {
                //somente usar para telas que nao terao a bottonnavbar
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(child: const Center(child: Text('Home'))),
    );
  }
}
