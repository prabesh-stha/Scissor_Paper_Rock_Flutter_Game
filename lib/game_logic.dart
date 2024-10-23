import 'dart:math';

class GameLogic {
  List<String> action = ["✂️","📄","🪨"];

  String generateRandom(){
    Random random = Random();
    return action[random.nextInt(3)];
  }

  String gameWinner(String player, String cpu){
    if(player == cpu){
      return "It's a draw";
    }else if ((player == "✂️" && cpu == "📄") || (player == "📄" && cpu == "🪨") || (player == "🪨" && cpu == "✂️")){
      return "Player won";
    }
    else{
      return "Cpu won";
    }
  }
}