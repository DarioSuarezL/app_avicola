import 'package:app_avicola/presentation/models/vaccine.dart';
import 'package:app_avicola/presentation/providers/vaccines_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VacunasScreen extends StatelessWidget {

  static const routeName = 'vacunas_screen';
  const VacunasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacunas'),
      ),
      body: _VacunasView(),
    );
  }
}

class _VacunasView extends StatelessWidget {
  const _VacunasView();

  @override
  Widget build(BuildContext context) {

    final vaccinesProvider = Provider.of<VaccinesProvider>(context, listen: false);
    List<Vaccine>? listVaccines = vaccinesProvider.vaccines;

    return ListView.builder(
      
      itemCount: vaccinesProvider.vaccines!.length ,
      itemBuilder: (context, index) => ListTile(
        title: Text(listVaccines![index].nombre),
        subtitle: Text(listVaccines[index].descripcion ?? ''),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){}
        ),
      );
  }
}