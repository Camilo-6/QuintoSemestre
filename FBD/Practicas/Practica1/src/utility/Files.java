package utility;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileWriter;
import products.*;
import sales.*;

/**
 * Class to manage the reading and writing of files
 * It is a singleton class
 */
public class Files {

    /* Singleton instance */
    private static Files file = new Files();

    /**
     * Private constructor
     */
    private Files() {
    }

    /**
     * Method to get the singleton instance
     * 
     * @return the singleton instance
     */
    public static Files getFiles() {
        return file;
    }

    /**
     * Method to save a list of products in a file
     * The file will be named "productos.csv"
     * In case of error, the method will show a message to the user
     * 
     * @param list the list of products to save
     */
    public void zipProducts(ProductCatalog catalog) {
        try {
            FileWriter writer = new FileWriter("productos.csv");
            writer.append("ID");
            writer.append(',');
            writer.append("Nombre");
            writer.append(',');
            writer.append("Categoria");
            writer.append(',');
            writer.append("Precio");
            writer.append(',');
            writer.append("Cantidad");
            writer.append('\n');
            for (Product product : catalog.getProducts()) {
                writer.append(String.valueOf(product.getId()));
                writer.append(',');
                writer.append(product.getName());
                writer.append(',');
                writer.append(String.valueOf(product.getCategory()));
                writer.append(',');
                writer.append(String.valueOf(product.getPrice()));
                writer.append(',');
                writer.append(String.valueOf(product.getQuantity()));
                writer.append('\n');
            }
            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println("Error al intentar guardar el archivo de productos");
            System.out.println("Los cambios de productos no se guardaron");
        }
    }

    /**
     * Method to read and return a list of products from a file
     * The file to read will be named "productos.csv"
     * In case of error, the method will show a message to the user and an empty
     * product catalog will be returned
     * 
     * @return the list of products read from the file
     */
    public ProductCatalog unzipProducts() {
        try {
            ProductCatalog catalog = new ProductCatalog();
            File file = new File("productos.csv");
            if (!file.exists()) {
                return catalog;
            }
            BufferedReader reader = new BufferedReader(new FileReader("productos.csv"));
            String line = reader.readLine();
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                int id = Integer.parseInt(data[0]);
                String name = data[1];
                Category category = Category.getCategory(data[2]);
                double price = Double.parseDouble(data[3]);
                int quantity = Integer.parseInt(data[4]);
                Product product = new Product(id, name, category, price, quantity);
                catalog.addProduct(product);
            }
            reader.close();
            return catalog;
        } catch (Exception e) {
            System.out.println("Error al intentar leer el archivo de productos");
            return new ProductCatalog();
        }
    }

    /**
     * Method to generate a file with a product catalog with some products
     * The file will be named "productos.csv"
     * In case of error, the method will show a message to the user and the program
     * will end
     */
    public void generateProducts() {
        ProductCatalog catalog = new ProductCatalog();
        catalog.addProduct(new Product(1, "Amoxicilina", Category.ANTIBIOTICOS, 150, 24));
        catalog.addProduct(new Product(5, "Aspirina", Category.DESINFLAMANTES, 50, 12));
        catalog.addProduct(new Product(4, "Nolotil", Category.ANALGESICOS, 100, 10));
        catalog.addProduct(new Product(2, "Gansito", Category.ALIMENTOS, 19, 101));
        catalog.addProduct(new Product(3, "Cafe", Category.BEBIDAS, 15, 2));
        catalog.addProduct(new Product(6, "Peluche", Category.OTROS, 1999, 1));
        try {
            FileWriter writer = new FileWriter("productos.csv");
            writer.append("ID");
            writer.append(',');
            writer.append("Nombre");
            writer.append(',');
            writer.append("Categoria");
            writer.append(',');
            writer.append("Precio");
            writer.append(',');
            writer.append("Cantidad");
            writer.append('\n');
            for (Product product : catalog.getProducts()) {
                writer.append(String.valueOf(product.getId()));
                writer.append(',');
                writer.append(product.getName());
                writer.append(',');
                writer.append(String.valueOf(product.getCategory()));
                writer.append(',');
                writer.append(String.valueOf(product.getPrice()));
                writer.append(',');
                writer.append(String.valueOf(product.getQuantity()));
                writer.append('\n');
            }
            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println("Error al intentar generar el archivo de productos");
            System.exit(0);
        }
    }

    /**
     * Method to save a list of sales in a file
     * The file will be named "ventas.csv"
     * In case of error, the method will show a message to the user
     * 
     * @param list the list of sales to save
     */
    public void zipSales(SaleCatalog catalog) {
        try {
            FileWriter writer = new FileWriter("ventas.csv");
            writer.append("Dia");
            writer.append(',');
            writer.append("Mes");
            writer.append(',');
            writer.append("Anio");
            writer.append(',');
            writer.append("Total");
            writer.append('\n');
            for (Sale sale : catalog.getSales()) {
                writer.append(String.valueOf(sale.getDay()));
                writer.append(',');
                writer.append(String.valueOf(sale.getMonth()));
                writer.append(',');
                writer.append(String.valueOf(sale.getYear()));
                writer.append(',');
                writer.append(String.valueOf(sale.getTotal()));
                writer.append('\n');
            }
            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println("Error al intentar guardar el archivo de ventas");
            System.out.println("Los cambios de ventas no se guardaron");
        }
    }

    /**
     * Method to read and return a list of sales from a file
     * The file to read will be named "ventas.csv"
     * In case of error, the method will show a message to the user and an empty
     * sales catalog will be returned
     * 
     * @return the list of sales read from the file
     */
    public SaleCatalog unzipSales() {
        try {
            SaleCatalog catalog = new SaleCatalog();
            File file = new File("ventas.csv");
            if (!file.exists()) {
                return catalog;
            }
            BufferedReader reader = new BufferedReader(new FileReader("ventas.csv"));
            String line = reader.readLine();
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                int day = Integer.parseInt(data[0]);
                int month = Integer.parseInt(data[1]);
                int year = Integer.parseInt(data[2]);
                double total = Double.parseDouble(data[3]);
                Sale sale = new Sale(day, month, year, total);
                catalog.addSale(sale);
            }
            reader.close();
            return catalog;
        } catch (Exception e) {
            System.out.println("Error al intentar leer el archivo de ventas");
            return new SaleCatalog();
        }
    }

    /**
     * Method to generate a file with a sale catalog with some sales
     * The file will be named "ventas.csv"
     * In case of error, the method will show a message to the user and the program
     * will end
     */
    public void generateSales() {
        SaleCatalog catalog = new SaleCatalog();
        catalog.addSale(new Sale(12, 6, 1901, 35));
        catalog.addSale(new Sale(28, 7, 2001, 159));
        catalog.addSale(new Sale(1, 1, 2000, 50));
        catalog.addSale(new Sale(24, 9, 2015, 5000));
        catalog.addSale(new Sale(28, 8, 2023, 10000));
        catalog.addSale(new Sale(4, 3, 2, 1));
        try {
            FileWriter writer = new FileWriter("ventas.csv");
            writer.append("Dia");
            writer.append(',');
            writer.append("Mes");
            writer.append(',');
            writer.append("Anio");
            writer.append(',');
            writer.append("Total");
            writer.append('\n');
            for (Sale sale : catalog.getSales()) {
                writer.append(String.valueOf(sale.getDay()));
                writer.append(',');
                writer.append(String.valueOf(sale.getMonth()));
                writer.append(',');
                writer.append(String.valueOf(sale.getYear()));
                writer.append(',');
                writer.append(String.valueOf(sale.getTotal()));
                writer.append('\n');
            }
            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println("Error al intentar generar el archivo de ventas");
            System.exit(0);
        }
    }

}
