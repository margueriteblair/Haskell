import java.util.Scanner;

public class GuessingGame {

    private static int W1 = 10, W2 = 10;
    public static void main(String[] args) {
        final Scanner console = new Scanner(System.in);
        final int secretNum = new Random().nextInt();

        printBalance();
        System.out.println("Wallet 1: PLEASE LOCK THE AMOUNT ?");
        int lockedValue = console.nextInt();
        W1 -= lockedValue;

        while (true) {
            System.out.println("WALLET 2: WHAT IS YOUR GUESS ?");
            int guess = console.nextInt();
            if (guess == secretNum) {
                W2 += lockedValue;
            } else if (guess < secretNum) {
                System.out.println("It's higher!");
            } else {
                System.out.println("It's lower!");
            }
        }
    }

    private static void printBalance() {
        System.out.println("\n-----------------------");
        System.out.println("WALLET 1: " + W1 + ", WALLET 2: " + W2);
        System.out.println("\n-----------------------");
    }
}