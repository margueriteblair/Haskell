public class GuessingGame {
    public static void main(String[] args) {
        final Scanner console = new Scanner(System.in);
        final int secretNum = new Random().nextInt();

        printBalance();
    }

    private static void printBalance() {
        System.out.println("\n-----------------------");
        System.out.println("WALLET 1: " + W1 + ", WALLET 2: " + W2);
        System.out.println("\n-----------------------)
    }
}