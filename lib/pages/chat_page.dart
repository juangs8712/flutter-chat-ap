import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart/chat_message.dart';

// -----------------------------------------------------------------------------
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  bool _estaEscribiendo = false;
  
  // esto es para no perder el focus del TextField cuando se escribe
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                maxRadius: 14,
                child: const Text('A.L.', style: TextStyle(fontSize: 12),),
              ),
              const SizedBox(height: 3,),

              Text('Ana Luz', style: TextStyle(color: Colors.blue[600]!, fontSize: 12),)

            ],
          ),
      ),

      body: Container(
        child: Column( children: [
          
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i)=> _messages[i]
            )
          ),

          const Divider(height: 1), 

          Container(
            color: Colors.white,
            child: _inputChat(),
          )

        ],),
      ),
    );
  }

  // -----------------------------------------------------------------------------
  Widget _inputChat(){
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric( horizontal: 8 ),
            
            child: Row(
              children: <Widget>[
                
                Flexible(
                  child: TextField(
                    controller: _textController, 
                    onSubmitted: _handleSummit,
                    onChanged: (value){
                      setState(() => _estaEscribiendo = ( value.trim().isNotEmpty ) ? true : false );
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                    focusNode: _focusNode,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric( horizontal: 4.0 ),
                  child: ( Platform.isIOS )
                    ? CupertinoButton(
                      child: const Text('Enviar'), 
                      onPressed: ( _estaEscribiendo )
                        ? () => _handleSummit( _textController.text )
                        : null,
                      )

                    : Container(  
                      margin: const EdgeInsets.symmetric( horizontal: 4 ),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: ( _estaEscribiendo )
                            ? () => _handleSummit( _textController.text )
                            : null, 
                        ),
                      ),
                    )
                )

              ]
            ),
          ),
          const SizedBox(height: 5,)
        ],
      )
    );
  }
  // -----------------------------------------------------------------------------
  _handleSummit(String text){
    
    if ( text.isEmpty ) {      
      _focusNode.requestFocus();
      return;
    }

    final newMessage = new ChatMessage(
      texto: text, 
      uid: '123',
      animationController: AnimationController(
        vsync: this, 
        duration: const Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    _textController.clear();
    _focusNode.requestFocus();
    setState(() => _estaEscribiendo = false);
  }
  // -----------------------------------------------------------------------------
  
  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMessage message in _messages ){
      message.animationController.dispose();
    }

    super.dispose();
  }
}
// -----------------------------------------------------------------------------