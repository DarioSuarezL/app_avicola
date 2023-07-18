import 'package:app_avicola/presentation/providers/incubation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncubacionScreen extends StatelessWidget {

  static const String routeName = 'incubacion_screen';
  const IncubacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de incubación'),
      ),
      body: const _IncubacionView(),
    );
  }
}

class _IncubacionView extends StatelessWidget {
  const _IncubacionView();

  @override
  Widget build(BuildContext context) {
    final incubationProvider = Provider.of<IncubationProvider>(context);
    // incubationProvider.getIncubation(2);
    return Center(
      child: Column(
        children: [
          Text('Id de incubadora: ${incubationProvider.incubation?.idInc ?? 'No definido'}'),
          Text('Id de incubación: ${incubationProvider.incubation?.idIncub ?? 'No definido'}'),
          Text('Inicio de incubación: ${incubationProvider.incubation?.inicio ?? 'No definido'}'),
          Text('Fin de incubación: ${incubationProvider.incubation?.finalizacion ?? 'No definido'}'),
          Text('Numero de huevos: ${incubationProvider.incubation?.nroHuevos ?? 'No definido'}'),
          Text('Numero de eclosionados: ${incubationProvider.incubation?.nroEclosionado ?? 'No definido'}'),
          
        ],
      ),
    );
  }
}