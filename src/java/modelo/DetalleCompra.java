package modelo;

import java.sql.Date;


public class DetalleCompra {
    private int codigoDetalleCompra;
    private String observaciones;
    private Date fechaServicio;
    private double precioUnitario;
    private int cantidad;
    private Boolean estado;
    private int codigoCompra;
    private int codigoProveedor;

    public DetalleCompra() {
    }

    public DetalleCompra(int codigoDetalleCompra, String observaciones, Date fechaServicio, double precioUnitario, int cantidad, Boolean estado, int codigoCompra, int codigoProveedor) {
        this.codigoDetalleCompra = codigoDetalleCompra;
        this.observaciones = observaciones;
        this.fechaServicio = fechaServicio;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.estado = estado;
        this.codigoCompra = codigoCompra;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoDetalleCompra() {
        return codigoDetalleCompra;
    }

    public void setCodigoDetalleCompra(int codigoDetalleCompra) {
        this.codigoDetalleCompra = codigoDetalleCompra;
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

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }
    
    
}
