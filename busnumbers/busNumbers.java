import java.util.*;
public class busNumbers {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] arr = new int[n]; 
        
        for(int i=0;i<n;i++){
            arr[i]=scanner.nextInt();
        } 
        scanner.close();
        Arrays.sort(arr); // stigande ordning på alla bussnummer

        String Res = String.valueOf(arr[0]);

        for(int i=1; i<= n-1; i++){ // Gå igenom hela arrayen

            if(arr[i] == arr[i-1]+1){ // se om värdet är direkt efterföljande på föregående

                if(i+1 <= n-1 && arr[i] == arr[i+1]-1){ // om det är det så kollar vi om nästa värde är direkt efterföljande -> 3 på varandra följande tal
                        Res = Res + "-"; // då det är åtminstone 3 på varandra efterföljande tal -> "-"
                        i = i++;
                        while( i <= n-2 && arr[i] == arr[i+1]-1){ // kollar vi om nästa värde är direkt efterföljande... 
                            i++;
                        }
                        Res = Res + arr[i]; // avsluta intervallet dvs "-"___
                }
                else{ Res = Res + " " + arr[i]; } // Om endast två på varandra efterföljande tal
            
            }
            else{ Res = Res + " " + arr[i]; } // ej på varandra efterföljande tal

        }
        System.out.println(Res);
    }

}