package sales;

import java.util.LinkedList;
import java.util.List;

/**
 * Class to represent a sale catalog
 * A sale catalog is a list of sales
 */
public class SaleCatalog {

    /**
     * The list of sales
     */
    private List<Sale> sales;

    /**
     * The constructor of the sale catalog
     */
    public SaleCatalog() {
        sales = new LinkedList<>();
    }

    /**
     * Method to get the list of sales
     * 
     * @return the list of sales
     */
    public List<Sale> getSales() {
        return sales;
    }

    public void setSales(List<Sale> sales) {
        this.sales = sales;
    }

    /**
     * Method to sort the sales in the catalog
     */
    private void sort() {
        sales.sort((s1, s2) -> {
            if (s1.getYear() != s2.getYear()) {
                return s1.getYear() - s2.getYear();
            } else if (s1.getMonth() != s2.getMonth()) {
                return s1.getMonth() - s2.getMonth();
            } else {
                return s1.getDay() - s2.getDay();
            }
        });
    }

    /**
     * Method to add a sale to the catalog
     * 
     * @param sale the sale to add
     */
    public void addSale(Sale sale) {
        sales.add(sale);
        sort();
    }

    /**
     * Method to return the sale catalog as a string
     * 
     * @return the sale catalog as a string
     */
    @Override
    public String toString() {
        String string = String.format("%-10s %-10s %-10s %-15s", "Dia", "Mes", "Anio", "Total Vendido");
        if (sales.isEmpty()) {
            string += "\nNo hay ventas registradas";
        }
        for (Sale sale : sales) {
            string += "\n" + sale;
        }
        string += "\n";
        return string;
    }

}
