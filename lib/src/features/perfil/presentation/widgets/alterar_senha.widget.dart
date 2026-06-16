import 'package:flutter/material.dart';

Future<void> showAlterarSenhaDialog(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  final _senhaAtualController = TextEditingController();
  final _novaSenhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: const Text(
          'Alterar Senha',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  controller: _senhaAtualController,
                  decoration: InputDecoration(labelText: 'Senha Atual'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }

                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }

                    if (value != _confirmarSenhaController.text) {
                      return 'As senhas não coincidem';
                    }

                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'A senha deve ter pelo menos uma letra maiúscula';
                    }

                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'A senha deve ter pelo menos uma letra minúscula';
                    }

                    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                      return 'A senha deve ter pelo menos um caractere especial';
                    }

                    return null;
                  },
                  controller: _novaSenhaController,
                  decoration: InputDecoration(labelText: 'Nova Senha'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }

                    if (value != _novaSenhaController.text) {
                      return 'As senhas não coincidem';
                    }

                    return null;
                  },
                  controller: _confirmarSenhaController,
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      );
    },
  );
}
