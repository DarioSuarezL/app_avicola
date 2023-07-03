import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


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

  @override
  Widget build(BuildContext context) {
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final colors = Theme.of(context).colorScheme;
    String name = '';
    String password = '';


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

                  ApiResponse apiRes = await userProvider.loginUser(nombreUsuario, contrasena);
                  if(apiRes.isOK()){
                    await Future.microtask(() => context.goNamed('home_screen'));
                  }else{
                    scaf.showSnackBar(
                      SnackBar(
                        backgroundColor: colors.primary,
                        content: Text(apiRes.msg!),
                        duration: const Duration(seconds: 2),
                      )
                    );
                  }

                }
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