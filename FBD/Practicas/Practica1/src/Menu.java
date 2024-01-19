import products.*;
import sales.*;
import utility.*;
import java.util.LinkedList;
import java.util.List;

/**
 * Class to represent the menu
 * The menu has a product catalog, a sale catalog, an asker, a files manager, a
 * in use boolean and an auxiliar product catalog
 */
public class Menu {

    /**
     * The product catalog
     */
    private ProductCatalog productCatalog;

    /**
     * The sale catalog
     */
    private SaleCatalog saleCatalog;

    /**
     * The asker
     */
    private Asker asker;

    /**
     * The files manager
     */
    private Files files;

    /**
     * The in use boolean
     */
    private boolean inUse;

    /**
     * The auxiliar product catalog
     */
    private ProductCatalog aux;

    /**
     * Constructor
     */
    public Menu() {
        asker = Asker.getAsker();
        files = Files.getFiles();
        productCatalog = files.unzipProducts();
        saleCatalog = files.unzipSales();
        inUse = true;
        aux = new ProductCatalog();
        cloneList();
    }

    /**
     * Method to clone the list of products
     */
    private void cloneList() {
        List<Product> auxProducts = new LinkedList<Product>();
        for (Product product : productCatalog.getProducts()) {
            auxProducts.add(product);
        }
        aux.setProducts(auxProducts);
    }

    /**
     * Method to make the menu work
     */
    public void work() {
        while (inUse) {
            System.out.println("\nBienvenido al sistema de inventario");
            int option = asker.askOption(printMenu(), 0, 8, "Opcion invalida");
            switch (option) {
                case 0:
                    System.out.println();
                    System.out.println("Productos");
                    System.out.println(productCatalog);
                    asker.askStringAny("Presiona cualquier tecla para continuar", "");
                    break;
                case 1:
                    addProduct();
                    break;
                case 2:
                    deleteProduct();
                    break;
                case 3:
                    modifyProduct();
                    break;
                case 4:
                    searchProducts();
                    break;
                case 5:
                    System.out.println();
                    System.out.println(saleCatalog);
                    asker.askStringAny("Presiona cualquier tecla para continuar", "");
                    break;
                case 6:
                    addSale();
                    break;
                case 7:
                    System.out.println("Preparando para guardar datos");
                    files.zipProducts(productCatalog);
                    files.zipSales(saleCatalog);
                    System.out.println("Datos guardados");
                    break;
                case 8:
                    System.out.println("Preparando para guardar datos");
                    inUse = false;
                    break;
            }
        }
        files.zipProducts(productCatalog);
        files.zipSales(saleCatalog);
        System.out.println("Datos guardados, hasta luego");
    }

    /**
     * Method to add a product
     */
    public void addProduct() {
        int id = asker.askInt("Ingresa el ID del producto (entero positivo o -1 para cancelar)", -1,
                Integer.MAX_VALUE, "ID invalido");
        boolean valid = searchValidId(id);
        if (id != -1) {
            if (valid) {
                String name = asker.askString("Ingresa el nombre del producto", "Nombre invalido");
                if (name.contains(",")) {
                    name = name.replace(",", "");
                    System.out.println("Se elimino la coma del nombre");
                }
                int categoryInt = asker.askOption(printCategory(), 0, 5, "Categoria invalida");
                Category category = Category.getCategory(categoryInt);
                double price = asker.askDouble("Ingresa el precio del producto (mayor o igual a 0)", 0,
                        Double.MAX_VALUE, "Precio invalido");
                int quantity = asker.askInt("Ingresa la cantidad del producto (mayor o igual a 0)", 0,
                        Integer.MAX_VALUE, "Cantidad invalida");
                Product product = new Product(id, name, category, price, quantity);
                productCatalog.addProduct(product);
                System.out.println("Producto agregado");
            } else {
                System.out.println("No se permiten productos con el mismo ID");
                System.out.println("Cancelando operacion");
            }
        }
    }

    /**
     * Method to delete a product
     */
    public void deleteProduct() {
        int id = asker.askInt("Ingresa el ID del producto (entero positivo o -1 para cancelar)", -1,
                Integer.MAX_VALUE, "ID invalido");
        boolean valid = searchValidId(id);
        if (id != -1) {
            if (!valid) {
                int index = productCatalog.searchProduct(id);
                Product product = productCatalog.getProduct(index);
                System.out.println("El producto a eliminar es:");
                System.out.println(product.show());
                int option = asker.askOption("¿Estas seguro de eliminarlo?\n[0] Si\n[1] No", 0, 1, "Opcion invalida");
                if (option == 0) {
                    productCatalog.deleteProduct(index);
                    System.out.println("Producto eliminado");
                } else {
                    System.out.println("Cancelando operacion");
                }
            } else {
                System.out.println("No se encontro un producto con ese ID");
                System.out.println("Cancelando operacion");
            }
        }
    }

    /**
     * Method to modify a product
     */
    public void modifyProduct() {
        int id = asker.askInt("Ingresa el ID del producto (entero positivo o -1 para cancelar)", -1,
                Integer.MAX_VALUE, "ID invalido");
        boolean valid = searchValidId(id);
        if (id != -1) {
            if (!valid) {
                int index = productCatalog.searchProduct(id);
                Product product = productCatalog.getProduct(index);
                boolean finish = false;
                while (!finish) {
                    System.out.println("\nEl producto a modificar es:");
                    System.out.println(product.show());
                    int option = asker.askOption(printModify(), 0, 4, "Opcion invalida");
                    switch (option) {
                        case 0:
                            String name = asker.askString("Ingresa el nuevo nombre del producto", "Nombre invalido");
                            if (name.contains(",")) {
                                name = name.replace(",", "");
                                System.out.println("Se elimino la coma del nombre");
                            }
                            product.setName(name);
                            System.out.println("Nombre modificado");
                            break;
                        case 1:
                            int categoryInt = asker.askOption(printCategory(), 0, 5, "Categoria invalida");
                            Category category = Category.getCategory(categoryInt);
                            product.setCategory(category);
                            System.out.println("Categoria modificada");
                            break;
                        case 2:
                            double price = asker.askDouble("Ingresa el nuevo precio del producto (mayor o igual a 0)",
                                    0, Double.MAX_VALUE, "Precio invalido");
                            product.setPrice(price);
                            System.out.println("Precio modificado");
                            break;
                        case 3:
                            int quantity = asker.askInt("Ingresa la nueva cantidad del producto (mayor o igual a 0)", 0,
                                    Integer.MAX_VALUE, "Cantidad invalida");
                            product.setQuantity(quantity);
                            System.out.println("Cantidad modificada");
                            break;
                        case 4:
                            finish = true;
                            break;
                    }
                }
            } else {
                System.out.println("No se encontro un producto con ese ID");
                System.out.println("Cancelando operacion");
            }
        }
    }

    /**
     * Method to search products
     */
    public void searchProducts() {
        boolean finish = false;
        ProductCatalog aux;
        while (!finish) {
            aux = new ProductCatalog();
            int option = asker.askOption(printSearch(), 0, 5, "Opcion invalida");
            switch (option) {
                case 0:
                    int id = asker.askInt("Ingresa el ID del producto (entero positivo)", 0, Integer.MAX_VALUE,
                            "ID invalido");
                    for (Product product : productCatalog.getProducts()) {
                        if (product.getId() == id) {
                            aux.addProduct(product);
                        }
                    }
                    System.out.println("Estos son los productos con ese ID");
                    System.out.println(aux);
                    break;
                case 1:
                    String name = asker.askString("Ingresa los caracteres que quieres buscar", "Nombre invalido");
                    name = name.toLowerCase();
                    for (Product product : productCatalog.getProducts()) {
                        if (product.getName().toLowerCase().contains(name)) {
                            aux.addProduct(product);
                        }
                    }
                    System.out.println("Estos son los productos con esos caracteres en el nombre");
                    System.out.println(aux);
                    break;
                case 2:
                    int categoryInt = asker.askOption(printCategory(), 0, 5, "Categoria invalida");
                    Category category = Category.getCategory(categoryInt);
                    for (Product product : productCatalog.getProducts()) {
                        if (product.getCategory().equals(category)) {
                            aux.addProduct(product);
                        }
                    }
                    System.out.println("Estos son los productos con esa categoria");
                    System.out.println(aux);
                    break;
                case 3:
                    double price = asker.askDouble("Ingresa el precio del producto (mayor o igual a 0)", 0,
                            Double.MAX_VALUE, "Precio invalido");
                    for (Product product : productCatalog.getProducts()) {
                        if (product.getPrice() == price) {
                            aux.addProduct(product);
                        }
                    }
                    System.out.println("Estos son los productos con ese precio");
                    System.out.println(aux);
                    break;
                case 4:
                    int quantity = asker.askInt("Ingresa la cantidad del producto (mayor o igual a 0)", 0,
                            Integer.MAX_VALUE, "Cantidad invalida");
                    for (Product product : productCatalog.getProducts()) {
                        if (product.getQuantity() == quantity) {
                            aux.addProduct(product);
                        }
                    }
                    System.out.println("Estos son los productos con esa cantidad");
                    System.out.println(aux);
                    break;
                case 5:
                    finish = true;
                    break;
            }
        }

    }

    /**
     * Method to add a sale
     */
    public void addSale() {
        cloneList();
        double money = 0;
        List<int[]> saleInfo = new LinkedList<int[]>();
        boolean finish = false;
        while (!finish) {
            int option = asker.askOption("¿Que quieres hacer?\n[0] Agregar producto\n[1] Terminar", 0, 1,
                    "Opcion invalida");
            switch (option) {
                case 0:
                    System.out.println(aux);
                    int id = asker.askInt("Ingresa el ID del producto (entero positivo)", 0, Integer.MAX_VALUE,
                            "ID invalido");
                    int index = aux.searchProduct(id);
                    if (index != -1) {
                        Product product = aux.getProduct(index);
                        if (product.getQuantity() != 0) {
                            int quantity = asker.askInt(
                                    "Ingresa la cantidad a comprar (entre 1 y " + product.getQuantity() + ")", 1,
                                    product.getQuantity(), "Cantidad invalida");
                            int[] info = { id, quantity };
                            saleInfo.add(info);
                            product.setQuantity(product.getQuantity() - quantity);
                            System.out.println("Producto agregado a la venta");
                        } else {
                            System.out.println("No hay productos disponibles");
                        }

                    } else {
                        System.out.println("No se encontro un producto con ese ID");
                    }
                    break;
                case 1:
                    if (saleInfo.size() == 0) {
                        System.out.println("No se puede hacer una venta sin productos");
                        System.out.println("Cancelando operacion");
                        return;
                    } else {
                        finish = true;
                    }
                    break;
            }
        }
        for (int[] info : saleInfo) {
            int index = productCatalog.searchProduct(info[0]);
            Product product = productCatalog.getProduct(index);
            money += product.getPrice() * info[1];
        }
        int[] date = asker.askDate();
        Sale sale = new Sale(date[0], date[1], date[2], money);
        saleCatalog.addSale(sale);
        System.out.println("Venta agregada");
        updateProductCatalog();
    }

    /**
     * Method to update the product catalog after a sale
     */
    private void updateProductCatalog() {
        List<Product> auxProducts = aux.getProducts();
        productCatalog.setProducts(auxProducts);
    }

    /**
     * Method to search if another product has the same id
     * 
     * @param id the id to search
     * @return true if the id is valid, false otherwise
     */
    public boolean searchValidId(int id) {
        int index = productCatalog.searchProduct(id);
        if (index == -1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Method to get the menu options as a string
     * 
     * @return the menu options as a string
     */
    public String printMenu() {
        String answer = "";
        answer += "¿Que quieres hacer?\n";
        answer += "[0] Ver productos\n";
        answer += "[1] Agregar producto\n";
        answer += "[2] Eliminar producto\n";
        answer += "[3] Modificar producto\n";
        answer += "[4] Buscar productos\n";
        answer += "[5] Ver ventas\n";
        answer += "[6] Hacer venta\n";
        answer += "[7] Guardar\n";
        answer += "[8] Guardar y salir";
        return answer;
    }

    /**
     * Method to get the category options as a string
     * 
     * @return the category options as a string
     */
    public String printCategory() {
        String answer = "";
        answer += "Ingresa la categoria\n";
        answer += "[0] Antibioticos\n";
        answer += "[1] Desinflamantes\n";
        answer += "[2] Analgesicos\n";
        answer += "[3] Alimentos\n";
        answer += "[4] Bebidas\n";
        answer += "[5] Otros";
        return answer;
    }

    /**
     * Method to get the modify options as a string
     * 
     * @return the modify options as a string
     */
    public String printModify() {
        String answer = "";
        answer += "¿Que quieres modificar?\n";
        answer += "[0] Nombre\n";
        answer += "[1] Categoria\n";
        answer += "[2] Precio\n";
        answer += "[3] Cantidad\n";
        answer += "[4] Terminar";
        return answer;
    }

    /**
     * Method to get the search options as a string
     * 
     * @return the search options as a string
     */
    public String printSearch() {
        String answer = "";
        answer += "¿Por que quieres buscar?\n";
        answer += "[0] ID\n";
        answer += "[1] Nombre\n";
        answer += "[2] Categoria\n";
        answer += "[3] Precio\n";
        answer += "[4] Cantidad\n";
        answer += "[5] Terminar";
        return answer;
    }

}
