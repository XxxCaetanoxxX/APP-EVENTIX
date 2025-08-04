import 'package:eventix/main.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/usecases/login_use_case.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/change_visibility.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/logar.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/login.bloc.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/error.login.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/logado.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/visibility.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginBloc _bloc = sl<LoginBloc>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => _bloc),
        BlocProvider<VisibilityBloc>(create: (_) => VisibilityBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SafeArea(
          child: BlocListener<LoginBloc, BaseState>(
            listener: (context, state) {
              if (state is ErrorLoginState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state is LogadoState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login realizado com sucesso!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: BlocBuilder<LoginBloc, BaseState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
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
                            final email = _emailController.text;
                            final senha = _senhaController.text;
                            final params = LoginUseCaseParams(
                              LoginRequestModel(email, senha),
                            );
                            context.read<LoginBloc>().add(LogarEvent(params));
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: 'senha',
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
