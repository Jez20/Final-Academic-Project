/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author FV
 */
public class Order {

    private int variantId;
    private String orderName;
    private int orderQuantity;
    private int orderPrice;
    private String orderAddress;
    private LocalDate orderDate;
    private LocalDate orderDateCompleted;
    private boolean isPaid;
    private String imgLink;

    public Order() {
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public void setOrderPrice(int orderPrice) {
        this.orderPrice = orderPrice;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public void setOrderDateCompleted(LocalDate orderDateCompleted) {
        this.orderDateCompleted = orderDateCompleted;
    }

    public void setIsPaid(boolean isPaid) {
        this.isPaid = isPaid;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public int getVariantId() {
        return variantId;
    }

    public String getOrderName() {
        return orderName;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public int getOrderPrice() {
        return orderPrice;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public LocalDate getOrderDateCompleted() {
        return orderDateCompleted;
    }

    public boolean isIsPaid() {
        return isPaid;
    }

    public String getImgLink() {
        return imgLink;
    }
}
