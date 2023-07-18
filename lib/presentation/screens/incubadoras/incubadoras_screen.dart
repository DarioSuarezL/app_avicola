import 'package:app_avicola/presentation/models/incubator.dart';
import 'package:app_avicola/presentation/providers/incubation_provider.dart';
import 'package:app_avicola/presentation/providers/incubators_provider.dart';
import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class IncubadorasScreen extends StatelessWidget {

  static const String routeName = 'incubadoras_screen';
  const IncubadorasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incubadoras'),
      ),
      body: const _IncubadorasView(),
      drawer: const CustomDrawer(),
    );
  }
}

class _IncubadorasView extends StatelessWidget {
  const _IncubadorasView();

  @override
  Widget build(BuildContext context) {

    final incubatorsProvider = Provider.of<IncubatorsProvider>(context, listen: false);
    final incubationProvider = Provider.of<IncubationProvider>(context, listen: false);
    List<Incubator>? listIncubators = incubatorsProvider.incubators;


    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(

        itemCount: listIncubators!.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('Incubadora ${listIncubators[index].idInc}', style: const TextStyle(fontSize: 20)),
            subtitle: Text('Numero de Huevos: ${listIncubators[index].nroHuevos}. Inicio: ${listIncubators[index].inicio}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit_document),
              onPressed: ()async{
                final scaf = ScaffoldMessenger.of(context);
                
                try{
                  await incubationProvider.getIncubation(listIncubators[index].idIncub!);

                  if(incubationProvider.incubation == null){
                    scaf.showSnackBar(
                      const SnackBar(
                        content: Text('Esa incubadora no tiene incubación'),
                      )
                    );
                  }else{
                    Future.microtask((){
                      context.pushNamed('incubacion_screen');
                    });
                  }      
                }catch(error){

                  scaf.showSnackBar(
                    const SnackBar(
                      content: Text('Esa incubadora no tiene incubación'),
                    )
                  );

                }
              },
            )
          );
        }
      ),
    );
  }
}