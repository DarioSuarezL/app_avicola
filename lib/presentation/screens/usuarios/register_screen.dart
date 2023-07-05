import 'package:app_avicola/config/menu/rol_items.dart';
import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart ';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  static const routeName = 'register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido nuevo usuario!'),
      ),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {


  _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final colors = Theme.of(context).colorScheme;
    // String? nombreUsuario;
    // String? contrasena;
    RolItem? role;
    String? name;
    String? password;



    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 20.0),
        children: [Column(
          children: [
            // Center(
            //   child: Image.asset(
            //     'assets/logo_app.png',
            //     width: 200.0,
            //     height: 200.0,
            //   )
            // ),
            
            const Text(
              'Ingrese sus datos:',
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
              // autofocus: true,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
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
              onChanged: (value){
                name = value;
              } 
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
              onChanged: (value){
                password = value;
              }
            ),

            const Divider(
              height: 20.0,
              color: Colors.transparent,
            ),

            TextFormField(
               decoration: const InputDecoration(
                labelText: 'Confirmar contraseña',
                // hintText: 'Debe tener almenos 8 caracteres',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Por favor ingrese su contraseña';
                }
                if(value != password){
                  return 'Las contraseñas no coinciden';
                }
                return null;
              },
            ),
            
            const Divider(
              height: 20.0,
              color: Colors.transparent,
            ),

            DropdownButtonFormField<RolItem>(
              hint: const Text('Selecione un rol'),
              value: role,
              items: appRolItems.map((rolItem){
                return DropdownMenuItem(
                  value: rolItem,
                  child: Text(rolItem.title),
                );
              }).toList(),
              onChanged: (value){
                role = value!;
                  // print(idRol!);
              },
            ),

            const Divider(
              height: 20.0,
              color: Colors.transparent,
            ),

            ElevatedButton(
              child: const Text('Registrar'),
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  String nombreUsuario = name!;
                  String contrasena = password!;
                  int id_rol = role!.id;
                  String username = userProvider.user!.nombreUsuario;
                  final scaf = ScaffoldMessenger.of(context);

                  ApiResponse res = await userProvider.registerUser(nombreUsuario, contrasena, id_rol, username);
                  

                  if(res.hasMsg()){
                    scaf.showSnackBar(
                      SnackBar(
                        content: Text(res.msg!),
                        duration: const Duration(seconds: 2),
                      )
                    );
                  }



                  // context.replaceNamed('home_screen');
                }
              },
            ),

            // const Divider(
            //   height: 60.0,
            //   color: Colors.transparent,
            // ),

            // TextButton(
            //   onPressed: (){
            //     context.replaceNamed('login_screen');
            //   },
            //   child: const Text('¿Ya tienes una cuenta? Ingresa aquí'),
            // )
          ],
        ),],
      ),
    );
  }
}