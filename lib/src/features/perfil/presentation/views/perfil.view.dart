import 'dart:io';

import 'package:eventix/main.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/recuperar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/perfil.bloc.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.loaded.state.dart';
import 'package:eventix/src/features/perfil/presentation/widgets/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
                                      color: Colors.purpleAccent,
                                    ),
                                    child: const Icon(Icons.edit),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                          labelText: 'Nome',
                          initialValue: perfil.name,
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          initialValue: perfil.email,
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                        ),
                        CustomTextField(
                          labelText: 'CPF',
                          initialValue: perfil.cpf,
                          controller: _cpfController,
                          focusNode: _cpfFocusNode,
                        ),
                        CustomTextField(
                          labelText: 'Celular',
                          initialValue: perfil.phone,
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: const Text('Alterar senha'),
                            icon: const Icon(Icons.key),
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
