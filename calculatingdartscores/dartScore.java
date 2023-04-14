import java.util.*;

public class dartScore {
    // Returnerar beroende på om det är en single, double eller triple
    private static String bind(int i){
        if (i == 1){
            return "single ";
        }
        else if (i == 2){
            return "double ";
        }
        else if (i == 3){
            return "triple ";
        }
        else{
            return "";
        }

    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int score = scanner.nextInt(); // target score
        scanner.close();

        boolean done = false; // Om vi har hittat ett sätt att nå target score
        
        // brute forcar oss igenom alla möjliga kombinationer av tre kast
        for (int x = 0; x <= 3; x++){
  		    for (int y = 0; y <= 3; y++){
  			    for (int z = 0; z <= 3; z++){
  				    for (int a = 1; a <= 20; a++){
  					    for (int b = 1; b <= 20; b++){
  						    for (int c = 1; c <= 20; c++){
  							    if (x*a + y*b + z*c == score && done == false) // Om vi har hittat en kombo för target score
  								{
  								    done = true;
                                    // Om det är en single, double eller triple
  								    if (x != 0 ) {
                                          System.out.printf(bind(x) + a + "\n"); 
                                      }
                                      if (y != 0 ) {
                                          System.out.printf(bind(y) + b + "\n");
                                      }
                                      if (z != 0 ) {
                                          System.out.printf(bind(z) + c + "\n");
                                      }
  								}
                              }
                          }
                      }
                  }
              }
        }

        if(done == false){
            System.out.println("impossible"); // Om det inte gick att hitta en kombo för target score
        }
    }
}
