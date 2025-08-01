import 'package:eventix/src/features/login/presentation/bloc/events/change_visibility.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/visibility.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) => print(value),
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  alignLabelWithHint: false,
                ),
              ),
              Container(height: 10),
              BlocBuilder<VisibilityBloc, bool>(
                builder: (context, state) {
                  return TextField(
                    onSubmitted: (value) {
                      print(value);
                      print(state);
                    },
                    obscureText: state,
                    controller: _senhaController,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        child: state
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onTap: () {
                          context.read<VisibilityBloc>().add(
                            ChangePasswordVisibilityEvent(),
                          );
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'senha',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
