import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _selectedAction;
  final List<String> _action = ["✂️","📄","🪨"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scissor Paper Rock"),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("sdklfj"),
            const Spacer(),
            Row(
              children: List.generate(_action.length, (index){
                return Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        _selectedAction = _action[index];
                      });
                      print(_selectedAction);
                    }, child: Text(_action[index], style: const TextStyle(fontSize: 30),)),
                    
                  ],
                ));
              })
            )
          ],
        ),
      ),
    );
  }
}