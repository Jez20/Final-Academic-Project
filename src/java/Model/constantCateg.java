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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class constantCateg {

    private HashMap<Integer, String> indexToSizeLabel;
    private HashMap<Integer, String> indextoGenderLabel;
    private HashMap<String, Integer> genderLabeltoIndex;
    private HashMap<String, Integer> sizeLabeltoIndex;

    public constantCateg(ResultSet size, ResultSet gender) {
        indexToSizeLabel = new HashMap<Integer, String>();
        indextoGenderLabel = new HashMap<Integer, String>();
        genderLabeltoIndex = new HashMap<String, Integer>();
        sizeLabeltoIndex = new HashMap<String, Integer>();
        if (size != null) {
            try {
                while (size.next()) {
                    indexToSizeLabel.put(size.getInt(1), size.getString(2));
                    sizeLabeltoIndex.put(size.getString(2), size.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        
        if (gender != null) {
            try {
                while (gender.next()) {
                    indextoGenderLabel.put(gender.getInt(1), gender.getString(2));
                    genderLabeltoIndex.put(gender.getString(2), gender.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public String toString() {
        String compile = "";
        for (Integer index : indexToSizeLabel.keySet()) {
            String key = index.toString();
            String value = indexToSizeLabel.get(index);
            compile += String.format("key: %s value: %s \n", key, value);
        }
        compile += "\n\n";

        for (Integer index : indextoGenderLabel.keySet()) {
            String key = index.toString();
            String value = indextoGenderLabel.get(index);
            compile += String.format("key: %s value: %s \n", key, value);
        }
        
        compile += "\n\n";

        for (String name : genderLabeltoIndex.keySet()) {
            String key = name.toString();
            int value = genderLabeltoIndex.get(name);
            compile += String.format("key: %s value: %d \n", key, value);
        }
        
        compile += "\n\n";

        for (String name : sizeLabeltoIndex.keySet()) {
            String key = name.toString();
            int value = sizeLabeltoIndex.get(name);
            compile += String.format("key: %s value: %d \n", key, value);
        }
        compile += "\n\n";
        return compile;
    }

    public int getGenderLabeltoIndex(String gender) {
        return this.genderLabeltoIndex.get(gender);

    }

    public String getIndextoGenterLabel(int index) {
        return this.indextoGenderLabel.get(index);
    }

    public int getSizeLabeltoIndex(String size) {
        return this.sizeLabeltoIndex.get(size);
    }
}
