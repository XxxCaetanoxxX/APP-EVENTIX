import 'dart:io';

import 'package:eventix/main.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/atualizar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/recuperar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/perfil.bloc.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.loaded.state.dart';
import 'package:eventix/src/features/perfil/presentation/widgets/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  File? _image;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _cpfFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final _cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+## (##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Deseja Editar a sua foto para a abaixo?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 200,
                    height: 200,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.file(
                      _image!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Confirmar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _phoneController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _cpfFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PerfilBloc>()..add(BuscarPerfilEvent()),
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9FF),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<PerfilBloc, BaseState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ErrorState) {
                    return Center(child: Text('Ops, ${state.message}'));
                  }

                  if (state is PerfilLoadedState) {
                    final perfil = state.perfil;
                    return Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: 150,
                                height: 150,
                                child: Image.network(
                                  perfil.image?.path ??
                                      'https://i.pinimg.com/736x/14/71/d6/1471d6e29dce10e758a39fced2540ab3.jpg',
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    child: const Icon(Icons.edit),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              spacing: 20,
                              children: [
                                CustomTextFormFieldWidget(
                                  labelText: 'Nome',
                                  initialValue: perfil.name,
                                  controller: _nameController,
                                  focusNode: _nameFocusNode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome não pode ser vazio';
                                    }
                                    if (value.length < 3) {
                                      return 'O nome deve ter pelo menos 3 caracteres';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormFieldWidget(
                                  labelText: 'Email',
                                  initialValue: perfil.email,
                                  controller: _emailController,
                                  focusNode: _emailFocusNode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O email não pode ser vazio';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Insira um email válido';
                                    }
                                    return null; // Retornar null significa que passou na validação!
                                  },
                                ),
                                CustomTextFormFieldWidget(
                                  labelText: 'CPF',
                                  initialValue: perfil.cpf,
                                  controller: _cpfController,
                                  focusNode: _cpfFocusNode,
                                  inputFormatters: [_cpfMaskFormatter],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O CPF não pode ser vazio';
                                    }
                                    if (_cpfMaskFormatter.getUnmaskedText().length != 11) {
                                      return 'O CPF deve ter 11 caracteres';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormFieldWidget(
                                  labelText: 'Celular',
                                  initialValue: perfil.phone,
                                  controller: _phoneController,
                                  focusNode: _phoneFocusNode,
                                  inputFormatters: [_phoneMaskFormatter],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O celular não pode ser vazio';
                                    }
                                    if (_phoneMaskFormatter.getUnmaskedText().length != 11) {
                                      return 'O celular deve ter 11 caracteres';
                                    }
                                    return null;
                                  },
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 2,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          label: const Text('Alterar senha'),
                                          icon: const Icon(Icons.key),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 2,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Perfil atualizado com sucesso!',
                                                  ),
                                                  backgroundColor: Colors.green,
                                                ),
                                              );

                                              context.read<PerfilBloc>().add(
                                                AtualizarPerfilEvent(
                                                  id: perfil.id,
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  phone: _phoneMaskFormatter.getUnmaskedText(),
                                                ),
                                              );
                                            }
                                          },
                                          child: const Text(
                                            'Salvar Alterações',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.deepPurpleAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return const Center(child: Text('Error ao carregar perfil'));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
