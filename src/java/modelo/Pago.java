package modelo;

import java.util.Date;

public class Pago {
    private int codigoPago;
    private double monto;
    private String datosValidos;
    private Date fechaPago;
    private String observaciones;
    private boolean estado;
    private int codigoCompra;
    private int codigoVenta;
    private int codigoMetodoPago;
    private int codigoEstadoPago;

    public Pago() {
    }

    public Pago(int codigoPago, double monto, String datosValidos, Date fechaPago, String observaciones, boolean estado, int codigoCompra, int codigoVenta, int codigoMetodoPago, int codigoEstadoPago) {
        this.codigoPago = codigoPago;
        this.monto = monto;
        this.datosValidos = datosValidos;
        this.fechaPago = fechaPago;
        this.observaciones = observaciones;
        this.estado = estado;
        this.codigoCompra = codigoCompra;
        this.codigoVenta = codigoVenta;
        this.codigoMetodoPago = codigoMetodoPago;
        this.codigoEstadoPago = codigoEstadoPago;
    }

    public int getCodigoPago() {
        return codigoPago;
    }

    public void setCodigoPago(int codigoPago) {
        this.codigoPago = codigoPago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getDatosValidos() {
        return datosValidos;
    }

    public void setDatosValidos(String datosValidos) {
        this.datosValidos = datosValidos;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public int getCodigoEstadoPago() {
        return codigoEstadoPago;
    }

    public void setCodigoEstadoPago(int codigoEstadoPago) {
        this.codigoEstadoPago = codigoEstadoPago;
    }
    
    
}