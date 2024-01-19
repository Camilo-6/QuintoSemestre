import utility.*;

/**
 * Class to make the first practice work
 */
public class Practica1 {

    /**
     * How to use the program
     */
    public static void use() {
        System.out.println("Uso: java Practica1 <option>");
        System.out.println("Opciones:");
        System.out.println("0: Uso normal");
        System.out.println("1: Generar archivo de productos");
        System.out.println("2: Generar archivo de clientes");
        System.exit(0);
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
        Files files = Files.getFiles();
        try {
            int option = Integer.parseInt(args[0]);
            switch (option) {
                case 0:
                    Menu menu = new Menu();
                    menu.work();
                    break;
                case 1:
                    files.generateProducts();
                    System.out.println("Archivo de productos generado :)");
                    break;
                case 2:
                    files.generateSales();
                    System.out.println("Archivo de ventas generado :)");
                    break;
                default:
                    use();
            }
        } catch (NumberFormatException e) {
            use();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Si lees esto, algo salio mal :(");
        }

    }

}
