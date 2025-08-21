package modelo;

import java.util.Date;

public class Venta {
    private int codigoVenta;
    private double comision;
    private String observaciones;
    private Date fechaVenta;
    private double descuento;
    private Boolean estado;
    private int codigoServicio;

    // Constructor vacío
    public Venta() {
    }
    

    // Constructor con parámetros (opcional)
    public Venta(int codigoVenta, double comision, String observaciones, Date fechaVenta, double descuento, Boolean estado, int codigoServicio) {    
        this.codigoVenta = codigoVenta;
        this.comision = comision;
        this.observaciones = observaciones;
        this.fechaVenta = fechaVenta;
        this.descuento = descuento;
        this.estado = estado;
        this.codigoServicio = codigoServicio;
    }

    // Getters y Setters

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public int getCodigoServicio() {
        return codigoServicio;
    }

    public void setCodigoServicio(int codigoServicio) {
        this.codigoServicio = codigoServicio;
    }
    
}