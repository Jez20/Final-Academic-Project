/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;

/**
 *
 * @author FV
 */
public class availableVariation {

    private HashMap<String, Integer> sizeAvailabletoPrice;
    String gender;
    
    public availableVariation(String gender){
        this.gender = gender;
        sizeAvailabletoPrice = new HashMap<String, Integer>();
    }

    public void addSizeandPrice(String size, int price) {
        this.sizeAvailabletoPrice.put(size, price);
    }

    public int getSizePrice(String size) {
        return sizeAvailabletoPrice.get(size);
    }
}
