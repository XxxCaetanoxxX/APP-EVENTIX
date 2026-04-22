import 'package:eventix/src/features/home/presentation/views/home.view.dart';
import 'package:eventix/src/core/views/em_construcao.view.dart';
import 'package:eventix/src/core/views/perfil.view.dart';
import 'package:eventix/src/core/widgets/botton_nav_bar.widget.dart';
import 'package:eventix/src/features/login/presentation/views/login.view.dart';
import 'package:eventix/src/injectors/injector.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('auth');
  await dotenv.load(fileName: ".env");
  await initDependencies();
  runApp(const EventixApp());
}

class EventixApp extends StatelessWidget {
  const EventixApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventix',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/main': (context) => const BottomNavBarWidget(),
        '/home': (context) => const HomeView(),
        '/perfil': (context) => const PerfilView(),
        '/construcao': (context) => const EmConstrucaoView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
