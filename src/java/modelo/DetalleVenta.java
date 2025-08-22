package modelo;

import java.util.Date;

public class DetalleVenta {
    private int codigoDetalleVenta;
    private String observaciones;
    private Date fechaServicio;
    private double precioUnitario;
    private int cantidad;
    private Boolean estado;
    private int codigoVenta;
    private int codigoCliente;
    
    // Constructor vacío
    public DetalleVenta() {}

    public DetalleVenta(int codigoDetalleVenta, String observaciones, Date fechaServicio, double precioUnitario, int cantidad, Boolean estado, int codigoVenta, int codigoCliente) {
        this.codigoDetalleVenta = codigoDetalleVenta;
        this.observaciones = observaciones;
        this.fechaServicio = fechaServicio;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.estado = estado;
        this.codigoVenta = codigoVenta;
        this.codigoCliente = codigoCliente;
    }
    
    
    // Getters y Setters
    public int getCodigoDetalleVenta() {
        return codigoDetalleVenta;
    }

    public void setCodigoDetalleVenta(int codigoDetalleVenta) {
        this.codigoDetalleVenta = codigoDetalleVenta;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFechaServicio() {
        return fechaServicio;
    }

    public void setFechaServicio(Date fechaServicio) {
        this.fechaServicio = fechaServicio;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }
    
}