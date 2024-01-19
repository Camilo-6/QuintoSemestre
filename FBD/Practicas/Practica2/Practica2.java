import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.LinkedList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Class to make the second practice work
 */
public class Practica2 {

    /**
     * How to use the program
     */
    public static void use() {
        System.out.println("Uso 1: java -cp .:json-simple-1.1.1.jar Practica2 productos");
        System.out.println("Uso 2: java -cp .:json-simple-1.1.1.jar Practica2 ventas");
        System.exit(0);
    }

    /**
     * Method to convert a csv file to json
     * The csv file is about products
     */
    @SuppressWarnings("unchecked")
    public static void productToJson() {
        List<String[]> products = new LinkedList<String[]>();
        try {
            File file = new File("productos.csv");
            if (!file.exists()) {
                System.out.println("No existe el archivo de productos");
                return;
            }
            BufferedReader reader = new BufferedReader(new FileReader("productos.csv"));
            String line = reader.readLine();
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                products.add(data);
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("Error al intentar leer el archivo de productos");
            return;
        }
        JSONArray jsonProducts = new JSONArray();
        try {
            for (String[] data : products) {
                JSONObject productDetails = new JSONObject();
                productDetails.put("ID", Integer.parseInt(data[0]));
                productDetails.put("Nombre", data[1]);
                productDetails.put("Categoria", data[2]);
                productDetails.put("Precio", Double.parseDouble(data[3]));
                productDetails.put("Cantidad", Integer.parseInt(data[4]));
                JSONObject productObject = new JSONObject();
                productObject.put("Producto", productDetails);
                jsonProducts.add(productObject);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al intentar convertir los datos");
            return;
        }
        try (FileWriter file = new FileWriter("productos.json")) {
            file.write(jsonProducts.toJSONString());
            file.flush();
        } catch (IOException e) {
            System.out.println("Error al intentar escribir el archivo de productos");
            return;
        }
    }

    /**
     * Method to convert a csv file to json
     * The csv file is about sales
     */
    @SuppressWarnings("unchecked")
    public static void salesToJson() {
        List<String[]> sales = new LinkedList<String[]>();
        try {
            File file = new File("ventas.csv");
            if (!file.exists()) {
                System.out.println("No existe el archivo de ventas");
                return;
            }
            BufferedReader reader = new BufferedReader(new FileReader("ventas.csv"));
            String line = reader.readLine();
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                sales.add(data);
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("Error al intentar leer el archivo de ventas");
            return;
        }
        JSONArray jsonSales = new JSONArray();
        try {
            for (String[] data : sales) {
                JSONObject saleDetails = new JSONObject();
                saleDetails.put("Dia", Integer.parseInt(data[0]));
                saleDetails.put("Mes", Integer.parseInt(data[1]));
                saleDetails.put("Anio", Integer.parseInt(data[2]));
                saleDetails.put("Total", Double.parseDouble(data[3]));
                JSONObject saleObject = new JSONObject();
                saleObject.put("Venta", saleDetails);
                jsonSales.add(saleObject);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al intentar convertir los datos");
            return;
        }
        try (FileWriter file = new FileWriter("ventas.json")) {
            file.write(jsonSales.toJSONString());
            file.flush();
        } catch (IOException e) {
            System.out.println("Error al intentar escribir el archivo de ventas");
            return;
        }
    }

    /**
     * Main method
     * 
     * @param args the arguments
     */
    public static void main(String[] args) {

        if (args.length != 1) {
            use();
        }

        if (args[0].equals("productos")) {
            productToJson();
        } else if (args[0].equals("ventas")) {
            salesToJson();
        } else {
            use();
        }

    }

}