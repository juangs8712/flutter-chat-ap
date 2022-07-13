import 'package:flutter/material.dart';

import '../widgets.dart/boton_azul.dart';
import '../widgets.dart/custom_center.dart';
import '../widgets.dart/custom_input.dart';
import '../widgets.dart/labels.dart';
import '../widgets.dart/logo.dart';

// -----------------------------------------------------------------------------
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body:  Center(
        child: ( width <= 450 )
          ? const _LoginBody()
          : CustomCenter(
            childWidth: 450, 
            color: Colors.grey.withOpacity(0.1), 
            child: const _LoginBody()
          ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
class _LoginBody extends StatelessWidget {
  const _LoginBody({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
      
              Logo( titulo: 'Registro', ),
      
              _Form(),
      
              Labels( title: '¿Ya tienes cuenta?', subTitle: 'Ingresa ahora!',route: 'login',),
      
              Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),),
      
            ]
          ),
        ),
      ),
    );
  }
}
// -----------------------------------------------------------------------------
class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity, 
            placeHolder: 'Nombre', 
            textController: nameCtrl, 
            keyboardType: TextInputType.text
          ),

          CustomInput(
            icon: Icons.mail_outlined, 
            placeHolder: 'Correo', 
            textController: emailCtrl, 
            keyboardType: TextInputType.emailAddress
          ),

          CustomInput(
            icon: Icons.lock_outline, 
            placeHolder: 'Contraseña', 
            textController: this.passCtrl, 
            keyboardType: TextInputType.emailAddress,
            isPassword: true,
          ),
          

          BotonAzul(
            text: 'Ingrese', 
            onPressed: (){
              print('Correo: ${emailCtrl.text}');
              print('Contraseña: ${passCtrl.text}');
            },)
        ]
      ),
    );
  }
}
// -----------------------------------------------------------------------------