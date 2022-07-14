import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../models/usuarios.dart';

// -----------------------------------------------------------------------------
class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final usuarios = [
    Usuarios( uid: '1', nombre: 'María', email: 'test1@test.com', online: true,),
    Usuarios( uid: '1', nombre: 'Ana',   email: 'test2@test.com', online: false,),
    Usuarios( uid: '1', nombre: 'Juan',  email: 'test3@test.com', online: true,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.exit_to_app, color: Colors.black87,)),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400],),
                  // Icon(Icons.check_circle, color: Colors.blue[400],),
            
          )
        ],
      ),
      
      body: LiquidPullToRefresh(
        onRefresh: _cargarUsuarios,

        child: _listViewUsuarios(),  
      )
    );
  }

  // -----------------------------------------------------------------------------
  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: ( _, i ) => _usuarioListTile( usuarios[i] ), 
      separatorBuilder: (_, i) => const Divider(), 
      itemCount: usuarios.length
    );
  }

  // -----------------------------------------------------------------------------
  ListTile _usuarioListTile(Usuarios usuario) {
    return ListTile( 
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),

      leading: CircleAvatar( 
        backgroundColor: Colors.blue[100], 
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: usuario.online
            ? Colors.green[400]
            : Colors.red
        ),
      ),
      );
  }
  // -----------------------------------------------------------------------------
  Future<void> _cargarUsuarios() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    print('Refresh complete');
  }
  // -----------------------------------------------------------------------------
}
// -----------------------------------------------------------------------------
