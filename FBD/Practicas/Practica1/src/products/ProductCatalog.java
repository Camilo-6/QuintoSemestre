package products;

import java.util.LinkedList;
import java.util.List;

/**
 * Class to represent a product catalog
 * A product catalog is a list of products
 */
public class ProductCatalog {

    /**
     * The list of products
     */
    private List<Product> products;

    /**
     * The constructor of the product catalog
     */
    public ProductCatalog() {
        products = new LinkedList<>();
    }

    /**
     * Method to get the list of products
     * 
     * @return the list of products
     */
    public List<Product> getProducts() {
        return products;
    }

    /**
     * Method to set the list of products
     * 
     * @param products the list of products
     */
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    /**
     * Method to sort the products in the catalog
     */
    private void sort() {
        products.sort((p1, p2) -> p1.getId() - p2.getId());
    }

    /**
     * Method to add a product to the catalog
     * 
     * @param product the product to add
     */
    public void addProduct(Product product) {
        products.add(product);
        sort();
    }

    /**
     * Method to replace a product in the catalog with another one
     * 
     * @param product the product to replace
     * @param index   the index of the product to replace
     */
    public void replaceProduct(Product product, int index) {
        products.set(index, product);
        sort();
    }

    /**
     * Method to delete a product from the catalog
     * 
     * @param index the index of the product to delete
     */
    public void deleteProduct(int index) {
        products.remove(index);
    }

    /**
     * Method to get the index of a product in the catalog
     * Returns -1 if the product is not found
     * 
     * @param id the ID of the product to search
     * @return the index of the product in the catalog
     */
    public int searchProduct(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return products.indexOf(product);
            }
        }
        return -1;
    }

    /**
     * Method to get the product in a given position
     * 
     * @param i the position
     * @return the product in the position
     */
    public Product getProduct(int i) {
        return products.get(i);
    }

    /**
     * Method to return the product catalog as a string
     * 
     * @return the product catalog as a string
     */
    @Override
    public String toString() {
        String string = String.format("%-5s %-20s %-20s %-15s  %-15s", "ID", "Nombre", "Categoria", "Precio",
                "Cantidad");
        if (products.isEmpty()) {
            string += "\nNo hay productos";
        }
        for (Product product : products) {
            string += "\n" + product;
        }
        string += "\n";
        return string;
    }

}
