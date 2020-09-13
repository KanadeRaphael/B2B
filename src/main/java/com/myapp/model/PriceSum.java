package com.myapp.model;

import java.math.BigDecimal;

public class PriceSum {
    private BigDecimal sum;
    private BigDecimal reduction;
    private BigDecimal transFee;

    public BigDecimal getSum() {
        return sum;
    }

    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }

    public BigDecimal getReduction() {
        return reduction;
    }

    public void setReduction(BigDecimal reduction) {
        this.reduction = reduction;
    }

    public BigDecimal getTransFee() {
        return transFee;
    }

    public void setTransFee(BigDecimal transFee) {
        this.transFee = transFee;
    }

    public PriceSum(BigDecimal sum, BigDecimal reduction, BigDecimal transFee) {
        this.sum = sum;
        this.reduction = reduction;
        this.transFee = transFee;
    }

    public PriceSum() {
    }
}
