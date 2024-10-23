import 'package:flutter/material.dart';
import 'package:scissor_paper_rock_game/game_logic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GameLogic _logic = GameLogic();
  String? _player;
  String? _result;
  String? _cpu;
  int _playerScore = 0;
  int _cpuScore = 0;
  bool _showAlert = false;

   void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  _showAlert = false;
                  _result = null;
                  _player = null;
                  _cpu = null;
                  _playerScore = 0;
                  _cpuScore = 0;
                  
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void gameLogic(){
   _cpu = _logic.generateRandom();
    _result = _logic.gameWinner(_player ?? "✂️", _cpu ?? "✂️");
    if(_result == "Cpu won"){
      _cpuScore += 1;
    }
    if(_result == "Player won"){
      _playerScore += 1;
    }
    if(_playerScore == 3 || _cpuScore == 3){
      _showAlert = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scissor Paper Rock"),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text("Player: $_playerScore", style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
        ],
        leading: Center(
          child: Padding(padding: const EdgeInsets.only(left: 8), 
                  child: Text("Cpu: $_cpuScore", style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(child: Text("CPU CHOICE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
            const SizedBox(height: 16,),
            if (_cpu != null)
              Center(child: Text(_cpu!, style: const TextStyle(fontSize: 30),)),
            const Spacer(),
            if (_result != null)
              Text(_result!),
            const Spacer(),
            if(_player != null)
              Text(_player!, style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 16,),
            const Center(child: Text("YOUR CHOICE", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
            Row(
              children: List.generate(_logic.action.length, (index){
                return Expanded(child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        _player = _logic.action[index];
                        gameLogic();
                      });
                      String message = "";
                      if(_showAlert){
                        if (_cpuScore == 3){
                          message = "YOU LOST🥺";
                        }
                        if (_playerScore == 3){
                          message = "YOU WON🥳";
                        }
                        _showAlertDialog(context, message);
                      }
                    }, child: Text(_logic.action[index], style: const TextStyle(fontSize: 30),)),
                    
                  ],
                ),
                ));
              })
            )
          ],
        ),
      ),
    );
  }
}