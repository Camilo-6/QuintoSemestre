package sales;

/**
 * Class to represent a sale
 * A sale must have a day, month, year and total sold
 */
public class Sale {

    /**
     * The day of the sale
     */
    private int day;

    /**
     * The month of the sale
     */
    private int month;

    /**
     * The year of the sale
     */
    private int year;

    /**
     * The total sold of the sale
     */
    private double totalSold;

    /**
     * The constructor of the sale
     * 
     * @param day       the day of the sale
     * @param month     the month of the sale
     * @param year      the year of the sale
     * @param totalSold the total sold of the sale
     */
    public Sale(int day, int month, int year, double totalSold) {
        this.day = day;
        this.month = month;
        this.year = year;
        this.totalSold = totalSold;
    }

    /**
     * Method to return the day of the sale
     * 
     * @return the day of the sale
     */
    public int getDay() {
        return day;
    }

    /**
     * Method to return the month of the sale
     * 
     * @return the month of the sale
     */
    public int getMonth() {
        return month;
    }

    /**
     * Method to return the year of the sale
     * 
     * @return the year of the sale
     */
    public int getYear() {
        return year;
    }

    /**
     * Method to return the total sold of the sale
     * 
     * @return the total sold of the sale
     */
    public double getTotal() {
        return totalSold;
    }

    /**
     * Method to return the sale as a string
     * 
     * @return the sale as a string
     */
    @Override
    public String toString() {
        return String.format("%-10d %-10d %-10d $%-15.2f", day, month, year, totalSold);
    }

}
