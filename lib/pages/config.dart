import 'package:flutter/material.dart';

class Configs extends StatefulWidget {
  

  @override
  State<Configs> createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.black12,
        title: Text('Configurações'),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Modo Escuro',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                Switch(
                  value: isSwitched1,
                  onChanged: (value) {
                    setState(
                      () {
                        isSwitched1 = value;
                        // print(isSwitched);
                      },
                    );
                  },
                  activeTrackColor: Colors.lightGreen,
                  activeColor: Colors.green,
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}






/*

Row(
            children: [
              Container(
                child: Text(
                  'Modo Drácula',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              Container(
                child: Switch(
                  value: isSwitched2,
                  onChanged: (value) {
                    setState(() {
                      isSwitched2 = value;
                      print(isSwitched2);
                    });
                  },
                  activeTrackColor: Colors.lightGreen,
                  activeColor: Colors.green,
                ),
              ),
            ],
          ),
*/
