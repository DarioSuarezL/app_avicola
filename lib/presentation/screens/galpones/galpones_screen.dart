import 'package:app_avicola/presentation/models/shed.dart';
import 'package:app_avicola/presentation/providers/sheds_provider.dart';
import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalponesScreen extends StatelessWidget {

  static const routeName = 'galpones_screen';
  const GalponesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de galpones'),
      ),
      body: _GalponesView(),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      )
    );
  }
}

class _GalponesView extends StatelessWidget {
  const _GalponesView();

  @override
  Widget build(BuildContext context) {

    final shedsProvider = Provider.of<ShedsProvider>(context, listen: false);
    List<Shed>? listSheds = shedsProvider.sheds; 

    return ListView.builder(
      itemCount: listSheds!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Galpón ${listSheds[index].idGalpon},   Dim: ${listSheds[index].dimension}', style: const TextStyle(fontSize: 20)),
          subtitle: Text('Capacidad: ${listSheds[index].capacidad}'),
          // trailing: IconButton(
          //   icon: const Icon(Icons.delete),
          //   onPressed: (){},
          // ),
        );
      },
    );
  }
}