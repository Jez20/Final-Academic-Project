/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author FV
 */
public enum Queries {
    startEnum(""),
    returnSizeCateg("SELECT * FROM PRODUCT_SIZE_TABLE"),
    returnGenderCateg("SELECT * FROM PRODUCT_GENDER_TABLE"),
    returnproductSchool("SELECT DISTINCT\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_ID,\n"
            + "PRODUCT_TABLE.PRODUCT_NAME,\n"
            + "PRODUCT_TABLE.PRODUCT_DESC,\n"
            + "PRODUCT_TABLE.PRODUCT_SCHOOL,\n"
            + "PRODUCT_TABLE.PRODUCT_IMG_LINK,\n"
            + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
            + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
            + "FROM PRODUCT_VARIANT_TABLE\n"
            + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
            + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
            + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
            + "AND PRODUCT_TABLE.PRODUCT_SCHOOL = ? "),
    signUp("INSERT INTO USER_TABLE (USER_PASSWORD, USER_ROLE, USER_EMAIL) "
            + "VALUES (?, ?, ?)"),
    logIn("SELECT * FROM USER_TABLE WHERE USER_EMAIL = ?"),
    specificProduct("SELECT DISTINCT\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_ID,\n"
            + "PRODUCT_TABLE.PRODUCT_NAME,\n"
            + "PRODUCT_TABLE.PRODUCT_DESC,\n"
            + "PRODUCT_TABLE.PRODUCT_SCHOOL,\n"
            + "PRODUCT_TABLE.PRODUCT_IMG_LINK,\n"
            + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
            + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
            + "FROM PRODUCT_VARIANT_TABLE\n"
            + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
            + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
            + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
            + "AND PRODUCT_TABLE.PRODUCT_SCHOOL = ? \n"
            + "AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = ? AND PRODUCT_VARIANT_TABLE.PRODUCT_STOCK > 0"),
    querywithSize("SELECT DISTINCT\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_ID,\n"
            + "PRODUCT_TABLE.PRODUCT_NAME,\n"
            + "PRODUCT_TABLE.PRODUCT_DESC,\n"
            + "PRODUCT_TABLE.PRODUCT_SCHOOL,\n"
            + "PRODUCT_TABLE.PRODUCT_IMG_LINK,\n"
            + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
            + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
            + "FROM PRODUCT_VARIANT_TABLE\n"
            + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
            + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
            + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
            + "AND PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE ? ESCAPE '!'\n"
            + "AND PRODUCT_VARIANT_TABLE.PRODUCT_PRICE BETWEEN ? AND ? \n"
            + "AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE ? ESCAPE '!'"
            + "AND PRODUCT_SIZE_TABLE.PRODUCT_SIZE = ?"),
    querywithOutSize("SELECT DISTINCT\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_ID,\n"
            + "PRODUCT_TABLE.PRODUCT_NAME,\n"
            + "PRODUCT_TABLE.PRODUCT_DESC,\n"
            + "PRODUCT_TABLE.PRODUCT_SCHOOL,\n"
            + "PRODUCT_TABLE.PRODUCT_IMG_LINK,\n"
            + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
            + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
            + "FROM PRODUCT_VARIANT_TABLE\n"
            + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
            + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
            + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
            + "AND PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE ? ESCAPE '!'\n"
            + "AND PRODUCT_VARIANT_TABLE.PRODUCT_PRICE BETWEEN ? AND ? \n"
            + "AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE ? ESCAPE '!'"),
    returnProductList("SELECT * FROM PRODUCT_TABLE"),
    returnProductVariation("SELECT DISTINCT\n"
            + "PRODUCT_VARIANT_TABLE.VARIANT_ID,\n"
            + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
            + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
            + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
            + "FROM PRODUCT_VARIANT_TABLE\n"
            + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
            + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
            + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
            + "AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = ?\n"
            + "AND PRODUCT_VARIANT_TABLE.PRODUCT_STOCK > 0"),
    addProduct("INSERT INTO PRODUCT_TABLE (PRODUCT_NAME, PRODUCT_DESC, PRODUCT_SCHOOL, PRODUCT_CATEGORY, PRODUCT_IMG_LINK) \n" +
"	VALUES (?, ?, ?, ?, ?)"),
    addProductVariation("INSERT INTO PRODUCT_VARIANT_TABLE (PRODUCT_ID, PRODUCT_GENDER_ID, PRODUCT_SIZE_ID, PRODUCT_PRICE, PRODUCT_STOCK) \n" +
"	VALUES (?, ?, ?, ?, ?)"),
    deleteProduct("DELETE FROM PRODUCT_TABLE WHERE PRODUCT_ID = ?"),
    deleteProductinVarition("DELETE FROM PRODUCT_VARIANT_TABLE WHERE PRODUCT_ID = ?");
    

    private String selection;

    public String getQuery() {
        return this.selection;
    }

    private Queries(String selection) {
        this.selection = selection;
    }
}
