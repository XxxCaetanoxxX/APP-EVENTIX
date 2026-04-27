import 'package:eventix/main.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/home/presentation/bloc/events/buscar_eventos.event.dart';
import 'package:eventix/src/features/home/presentation/bloc/home.bloc.dart';
import 'package:eventix/src/features/home/presentation/bloc/states/home_loaded.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(BuscarEventosEvent()),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<HomeBloc, BaseState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ErrorState) {
                return Center(child: Text('Ops, ${state.message}'));
              }
              if (state is HomeLoadedState) {
                final lista = state.listaEventos;

                if (lista.isEmpty) {
                  return const Center(child: Text('Nenhum evento encontrado.'));
                }

                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final evento = lista[index];
                    return ListTile(title: Text(evento.name));
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
