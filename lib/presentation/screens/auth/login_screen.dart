import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatelessWidget {

  static const routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido de nuevo!'),
      ),
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  _LoginView();
  String name = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 20.0),
        children: [
          Column(
          children: [
            Center(
              child: Image.asset(
                'assets/logo_app.png',
                width: 200.0,
                height: 200.0,
              )
            ),
            
            const Text(
              'Ingrese sus credenciales:',
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
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
                // hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Por favor ingrese su nombre de usuario';
                }
                return null;
              },
              onChanged: (value) => name = value,
            ),

            const Divider(
              height: 20.0,
              color: Colors.transparent,
            ),

            TextFormField(
               decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Debe tener almenos 8 caracteres',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Por favor ingrese su contraseña';
                }
                return null;
              },
              onChanged: (value) => password = value,
            ),

            const Divider(
              height: 20.0,
              color: Colors.transparent,
            ),

            ElevatedButton(
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  final nombreUsuario = name;
                  final contrasena = password;
                  final scaf = ScaffoldMessenger.of(context);
                  

                }
                context.replaceNamed('home_screen');
              },
              child: const Text('Ingresar'),
            ),

            const Divider(
              height: 140.0,
              color: Colors.transparent,
            ),

            TextButton(
              onPressed: (){
                context.replaceNamed('register_screen');
              },
              child: const Text('¿No tienes una cuenta? Regístrate aquí'),
            )

          ],
        ),
        ],
      ),
    );
  }
}