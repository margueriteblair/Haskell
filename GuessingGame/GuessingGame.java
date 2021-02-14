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
    }

    private static void printBalance() {
        System.out.println("\n-----------------------");
        System.out.println("WALLET 1: " + W1 + ", WALLET 2: " + W2);
        System.out.println("\n-----------------------");
    }
}