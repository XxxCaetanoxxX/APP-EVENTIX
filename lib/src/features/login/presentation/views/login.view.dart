import 'package:eventix/main.dart';
import 'package:eventix/src/core/widgets/botton_nav_bar.widget.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
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
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _senhaFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _emailFocusNode.dispose();
    _senhaFocusNode.dispose();
    super.dispose();
  }

  void _submitLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        LogarEvent(
          email: _emailController.text,
          password: _senhaController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => sl<LoginBloc>()),
        BlocProvider<VisibilityBloc>(create: (_) => VisibilityBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Login'), centerTitle: true),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: BlocListener<LoginBloc, BaseState>(
              listener: (context, state) {
                if (state is ErrorLoginState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBarWidget(),
                      ),
                    );
                  });
                }

                if (state is LogadoState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login realizado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBarWidget(),
                      ),
                    );
                  });
                }
              },
              child: BlocBuilder<LoginBloc, BaseState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextFormField(
                            focusNode: _emailFocusNode,
                            onFieldSubmitted: (value) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_senhaFocusNode);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email é obrigatório';
                              }
                              if (!value.contains('@')) {
                                return 'Email inválido';
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email),
                              alignLabelWithHint: false,
                            ),
                          ),
                        ),
                        Container(height: 10),
                        BlocBuilder<VisibilityBloc, bool>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Senha é obrigatória';
                                  }
                                  if (value.length < 6) {
                                    return 'Senha deve ter pelo menos 6 caracteres';
                                  }
                                  return null;
                                },
                                focusNode: _senhaFocusNode,
                                onFieldSubmitted: (_) => _submitLogin(context),
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
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => _submitLogin(context),
                              child: const Text('Entrar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
