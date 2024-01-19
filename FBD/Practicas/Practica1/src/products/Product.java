package products;

/**
 * Class to represent a product
 * A product must have a ID, name, category, price and a quantity
 */
public class Product {

    /**
     * The ID of the product
     */
    private int id;

    /**
     * The name of the product
     */
    private String name;

    /**
     * The category of the product
     */
    private Category category;

    /**
     * The price of the product
     */
    private double price;

    /**
     * The quantity of the product
     */
    private int quantity;

    /**
     * The constructor of the product
     * 
     * @param id       the ID of the product
     * @param name     the name of the product
     * @param category the category of the product
     * @param price    the price of the product
     * @param quantity the quantity of the product
     */
    public Product(int id, String name, Category category, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    /**
     * Method to get the ID of the product
     * 
     * @return the ID of the product
     */
    public int getId() {
        return id;
    }

    /**
     * Method to set the ID of the product
     * 
     * @param id the ID of the product
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Method to get the name of the product
     * 
     * @return the name of the product
     */
    public String getName() {
        return name;
    }

    /**
     * Method to set the name of the product
     * 
     * @param name the name of the product
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Method to get the category of the product
     * 
     * @return the category of the product
     */
    public Category getCategory() {
        return category;
    }

    /**
     * Method to set the category of the product
     * 
     * @param category the category of the product
     */
    public void setCategory(Category category) {
        this.category = category;
    }

    /**
     * Method to get the price of the product
     * 
     * @return the price of the product
     */
    public double getPrice() {
        return price;
    }

    /**
     * Method to set the price of the product
     * 
     * @param price the price of the product
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Method to get the quantity of the product
     * 
     * @return the quantity of the product
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * Method to set the quantity of the product
     * 
     * @param quantity the quantity of the product
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * Method to return the product as a string
     * 
     * @return the product as a string
     */
    @Override
    public String toString() {
        return String.format("%-5d %-20s %-20s $%-15.2f %-15d", id, name, category, price, quantity);
    }

    /**
     * Method to return the product as a string
     * 
     * @return the product as a string
     */
    public String show() {
        return String.format("Producto: %s Categoria: %s Precio: $%.2f Cantidad: %d", name, category, price, quantity);
    }

    public Product clone() {
        return new Product(id, name, category, price, quantity);
    }

}
