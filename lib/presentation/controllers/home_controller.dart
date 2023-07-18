import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/providers/incubators_provider.dart';
import 'package:app_avicola/presentation/providers/sheds_provider.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:app_avicola/presentation/providers/users_provider.dart';
import 'package:app_avicola/presentation/providers/vaccines_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


class HomeController{ // Logica de los providers de el screen home

  void getData(BuildContext context, String routeName) async{
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final shedsProvider = Provider.of<ShedsProvider>(context, listen: false);
    final vaccinesProvider = Provider.of<VaccinesProvider>(context, listen: false);
    final incubatorsProvider = Provider.of<IncubatorsProvider>(context, listen: false);


    final scaf = ScaffoldMessenger.of(context);
    ApiResponse apiRes;
    apiRes = ApiResponse(status: 1, msg: 'Error la ruta no existe');
    
    if(routeName == "vacunas_screen"){
      apiRes = await vaccinesProvider.getVaccines();
    }
    if(routeName == 'usuarios_screen'){
      apiRes = await usersProvider.getUsers(userProvider.user!.idRol);
    }
    if(routeName == 'galpones_screen'){
      apiRes = await shedsProvider.getSheds();
    }
    if(routeName == 'incubadoras_screen'){
      apiRes = await incubatorsProvider.getIncubators();  
    }
    if(routeName == 'alertas_screen'){
      apiRes = ApiResponse(status: 0);
    }




    if(apiRes.hasMsg()){
      scaf.showSnackBar(
        SnackBar(
          content: Text(apiRes.msg ?? 'Error al obtener los datos'),
          duration: const Duration(seconds: 2),
        )
      );

    }else{
      Future.microtask(() => context.pushNamed(routeName));
    }
    // Future.microtask(() => context.pushNamed(routeName));
  }
}