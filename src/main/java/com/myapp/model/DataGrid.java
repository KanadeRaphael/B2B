package com.myapp.model;

import java.util.ArrayList;
import java.util.List;

public class DataGrid<T> {

    private Integer totalpg;
    private Integer total;
    private List<T> rows = new ArrayList<T>();

    public DataGrid() {
    }

    public DataGrid(Integer totalpg, List<T> rows) {
        this.totalpg = totalpg;
        this.rows = rows;
    }

    public Integer getTotalpg() {
        return totalpg;
    }

    public void setTotalpg(Integer totalpg) {
        this.totalpg = totalpg;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}

