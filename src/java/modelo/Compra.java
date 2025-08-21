package modelo;

import java.sql.Date;


public class Compra {
    private int codigoCompra;
    private double total;
    private String observaciones;
    private Date fechaCompra;
    private Boolean estado;
    private int codigoProveedor;

    public Compra() {
    }

    public Compra(int codigoCompra, double total, String observaciones, Date fechaCompra, Boolean estado, int codigoProveedor) {
        this.codigoCompra = codigoCompra;
        this.total = total;
        this.observaciones = observaciones;
        this.fechaCompra = fechaCompra;
        this.estado = estado;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    
    
    
}
