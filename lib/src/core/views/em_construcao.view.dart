import 'package:flutter/material.dart';

class EmConstrucaoView extends StatefulWidget {
  const EmConstrucaoView({super.key});

  @override
  State<EmConstrucaoView> createState() => _EmConstrucaoViewState();
}

class _EmConstrucaoViewState extends State<EmConstrucaoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.build, size: 50),
              Container(height: 10,),
              Text('Tela em desenvolvimento', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
