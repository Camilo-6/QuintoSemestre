package utility;

import java.util.Scanner;

/**
 * Class to ask for user input
 * It is a singleton class
 */
public class Asker {

    /* Singleton instance */
    private static Asker asker = new Asker();

    /**
     * Private constructor
     */
    private Asker() {
    }

    /**
     * Method to get the singleton instance
     * 
     * @return the singleton instance
     */
    public static Asker getAsker() {
        return asker;
    }

    /**
     * Method to ask for an option in the form of an integer
     * The method will keep asking until the user enters a valid option
     * The result is in the range [min, max]
     * 
     * @param message the message to show to the user
     * @param min     the minimum value of the option
     * @param max     the maximum value of the option
     * @param error   the error message to show to the user
     * @return the option entered by the user
     */
    public int askOption(String message, int min, int max, String error) {
        int answer = -1;
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println(message);
            try {
                String text = sc.nextLine();
                answer = Integer.parseInt(text);
                if (answer >= min && answer <= max) {
                    valid = true;
                } else {
                    System.out.println(error);
                }
            } catch (NumberFormatException nfe) {
                System.out.println(error);
            }
        }
        return answer;
    }

    /**
     * Method to ask for a integer
     * The method will keep asking until the user enters a valid integer
     * The result is in the range [min, max]
     * 
     * @param message the message to show to the user
     * @param min     the minimum value of the option
     * @param max     the maximum value of the option
     * @param error   the error message to show to the user
     * @return the integer entered by the user
     */
    public int askInt(String message, int min, int max, String error) {
        int answer = -1;
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println(message);
            try {
                String text = sc.nextLine();
                answer = Integer.parseInt(text);
                if (answer >= min && answer <= max) {
                    valid = true;
                } else {
                    System.out.println(error);
                }
            } catch (NumberFormatException nfe) {
                System.out.println(error);
            }
        }
        return answer;
    }

    /**
     * Method to ask for a double
     * The method will keep asking until the user enters a valid double
     * The result is in the range [min, max]
     * 
     * @param message the message to show to the user
     * @param min     the minimum value of the option
     * @param max     the maximum value of the option
     * @param error   the error message to show to the user
     * @return the double entered by the user
     */
    public double askDouble(String message, double min, double max, String error) {
        double answer = -1;
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println(message);
            try {
                String text = sc.nextLine();
                answer = Double.parseDouble(text);
                if (answer >= min && answer <= max) {
                    valid = true;
                } else {
                    System.out.println(error);
                }
            } catch (NumberFormatException nfe) {
                System.out.println(error);
            }
        }
        return answer;
    }

    /**
     * Method to ask for a string
     * The method will keep asking until the user enters a valid string
     * The result must not be empty
     * 
     * @param message the message to show to the user
     * @param error   the error message to show to the user
     * @return the string entered by the user
     */
    public String askString(String message, String error) {
        String answer = "";
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println(message);
            try {
                answer = sc.nextLine();
                if (!answer.isEmpty()) {
                    valid = true;
                } else {
                    System.out.println(error);
                }
            } catch (NumberFormatException nfe) {
                System.out.println(error);
            }
        }
        return answer;
    }

    /**
     * Method to ask for a any string
     * 
     * @param message the message to show to the user
     * @param error   the error message to show to the user
     * @return the string entered by the user
     */
    public String askStringAny(String message, String error) {
        String answer = "";
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println(message);
            try {
                answer = sc.nextLine();
                valid = true;
            } catch (NumberFormatException nfe) {
                System.out.println(error);
            }
        }
        return answer;
    }

    /**
     * Method to ask for a date in a specific format
     * The method will keep asking until the user enters a valid date
     * 
     * @return the date entered by the user as an array of integers
     */
    public int[] askDate() {
        int[] date = new int[3];
        String answer = "";
        boolean valid = false;
        Scanner sc = new Scanner(System.in);
        while (!valid) {
            System.out.println("Introduce la fecha de la venta (con el formato dd/mm/yyyy)");
            try {
                answer = sc.nextLine();
                if (answer.isEmpty()) {
                    System.out.println("La fecha no puede estar vacía");
                    continue;
                }
                String[] parts = answer.split("/");
                if (parts.length == 3) {
                    date[0] = Integer.parseInt(parts[0]);
                    date[1] = Integer.parseInt(parts[1]);
                    date[2] = Integer.parseInt(parts[2]);
                    if (validDate(date[0], date[1], date[2])) {
                        valid = true;
                    } else {
                        System.out.println("No es una fecha válida");
                    }
                } else {
                    System.out.println("La fecha debe tener el formato dd/mm/yyyy");
                }
            } catch (NumberFormatException nfe) {
                System.out.println("La fecha debe tener el formato dd/mm/yyyy");
            }
        }
        return date;
    }

    /**
     * Method to see if a date is valid
     * 
     * @param day   the day of the date
     * @param month the month of the date
     * @param year  the year of the date
     * @return true if the date is valid, false otherwise
     */
    public boolean validDate(int day, int month, int year) {
        if (year < 0) {
            return false;
        }
        if (month < 1 || month > 12) {
            return false;
        }
        if (day < 1) {
            return false;
        }
        if (month == 2) {
            if (isLeapYear(year)) {
                return day <= 29;
            } else {
                return day <= 28;
            }
        }
        if (month == 4 || month == 6 || month == 9 || month == 11) {
            return day <= 30;
        }
        return day <= 31;
    }

    /**
     * Method to see if a year is a leap year
     * 
     * @param year the year to check
     * @return true if the year is a leap year, false otherwise
     */
    private boolean isLeapYear(int year) {
        if (year % 4 == 0) {
            if (year % 100 == 0) {
                return (year % 400 == 0);
            }
            return true;
        }
        return false;
    }

}
