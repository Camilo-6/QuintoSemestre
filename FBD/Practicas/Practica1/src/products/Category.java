package products;

/**
 * Enum to represent categories
 */
public enum Category {

    /* The categories */
    ANTIBIOTICOS, DESINFLAMANTES, ANALGESICOS, ALIMENTOS, BEBIDAS, OTROS;

    /**
     * Method to get the category from an integer
     * In case of not finding the category, the method will return null
     * 
     * @param i the integer to convert
     * @return the category associated with the integer
     */
    public static Category getCategory(int i) {
        switch (i) {
            case 0:
                return ANTIBIOTICOS;
            case 1:
                return DESINFLAMANTES;
            case 2:
                return ANALGESICOS;
            case 3:
                return ALIMENTOS;
            case 4:
                return BEBIDAS;
            case 5:
                return OTROS;
            default:
                return null;
        }
    }

    /**
     * Method to return an integer from the category that is calling the method
     * In case of not finding the category, the method will return -1
     * 
     * @return the integer associated with the category
     */
    public int getInt() {
        switch (this) {
            case ANTIBIOTICOS:
                return 0;
            case DESINFLAMANTES:
                return 1;
            case ANALGESICOS:
                return 2;
            case ALIMENTOS:
                return 3;
            case BEBIDAS:
                return 4;
            case OTROS:
                return 5;
            default:
                return -1;
        }
    }

    /**
     * Method to get the category from a string
     * In case of not finding the category, the method will return null
     * 
     * @param category the string to convert
     * @return the category associated with the string
     */
    public static Category getCategory(String category) {
        switch (category) {
            case "Antibioticos":
                return ANTIBIOTICOS;
            case "Desinflamantes":
                return DESINFLAMANTES;
            case "Analgesicos":
                return ANALGESICOS;
            case "Alimentos":
                return ALIMENTOS;
            case "Bebidas":
                return BEBIDAS;
            case "Otros":
                return OTROS;
            default:
                return null;
        }
    }

    /**
     * Method to return the category as a string
     * 
     * @return the category as a string
     */
    @Override
    public String toString() {
        switch (this) {
            case ANTIBIOTICOS:
                return "Antibioticos";
            case DESINFLAMANTES:
                return "Desinflamantes";
            case ANALGESICOS:
                return "Analgesicos";
            case ALIMENTOS:
                return "Alimentos";
            case BEBIDAS:
                return "Bebidas";
            case OTROS:
                return "Otros";
            default:
                return "";
        }
    }

    /**
     * Method to compare two categories
     * 
     * @param obj the object to compare
     * @return true if the categories are the same, false otherwise
     */
    public boolean equals(Category category) {
        return this.getInt() == category.getInt();
    }

}
