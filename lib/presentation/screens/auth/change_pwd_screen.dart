// import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePwdScreen extends StatelessWidget {

  static const String routeName = 'change_pwd_screen';
  const ChangePwdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar contraseña'),
      ),
      body: _ChangePwdView(),
      // drawer: const CustomDrawer(),
    );
  }
}

class _ChangePwdView extends StatelessWidget {

  final formkey = GlobalKey<FormState>();
  _ChangePwdView();

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? name;
    String? oldPwd;
    String? newPwd;

    return Form(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 20.0),
        children:  <Widget> [
          Column(
            children: [
              const Text(
              'Contraseña actual:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
              ),

              const SizedBox(
                width: 250.0,
                height: 40.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña actual',
                  hintText: 'Ingrese su contraseña actual',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Ingrese su contraseña actual' : null,
              ),

              const Divider(
                height: 20.0,
                color: Colors.transparent,
              ),

              const Text(
                'Nueva contraseña:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
              ),

              
              const SizedBox(
                width: 250.0,
                height: 40.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña nueva',
                  hintText: 'Ingrese su nueva contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Ingrese su nueva contraseña' : null,
              ),

              const Divider(
                height: 20.0,
                color: Colors.transparent,
              ),


              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña nueva',
                  hintText: 'Ingrese su nueva contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value){
                  if (value!.isEmpty) {
                    return 'Ingrese su nueva contraseña aquí tambien';
                  }

                  if (value != newPwd) {
                    return 'Las contraseñas no coinciden';
                  }

                  return null;
                },
              ),

              const Divider(
                height: 20.0,
                color: Colors.transparent,
              ),

              ElevatedButton(
                onPressed: (){

                },
                child: const Text('Cambiar contraseña'),
              )

            ],
          )
        ],
      ) ,
    );
  }
}