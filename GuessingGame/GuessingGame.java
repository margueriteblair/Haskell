import java.util.Scanner;
import java.util.*;

public class GuessingGame {

    private static int W1 = 10, W2 = 10;
    private static int MAGIC_NUM = 123, MAX=256;
    public static void main(String[] args) {
        final Scanner console = new Scanner(System.in);
        final int secretNum = new Random().nextInt(MAX);

        printBalance();
        System.out.println("WALLET 1: PLEASE LOCK THE AMOUNT ?");
        int lockedValue = console.nextInt();
        W1 -= lockedValue;

        while (true) {
            System.out.println("WALLET 2: WHAT IS YOUR GUESS ?");
            int guess = console.nextInt();
            if (guess == secretNum) {
                W2 += lockedValue;
                break;
            } else if (guess < secretNum) {
                System.out.println("It's higher!");
            } else {
                System.out.println("It's lower!");
            }
        }

        System.out.println("Congrats, you've won!");
        printBalance();
        console.close();
    }

    private static void printBalance() {
        System.out.println("\n-----------------------");
        System.out.println("WALLET 1: " + W1 + ", WALLET 2: " + W2);
        System.out.println("\n-----------------------");
    }
}