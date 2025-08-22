/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Diego Sebastian
 */
public class EstadoPago {
    private int codigoEstadoPago;
    private Boolean notificacionEnviada;
    private String Observaciones;
    private Date fechaCambio;
    private Boolean estado;

    public EstadoPago() {
    }

    public EstadoPago(int codigoEstadoPago, Boolean notificacionEnviada, String Observaciones, Date fechaCambio, Boolean estado) {
        this.codigoEstadoPago = codigoEstadoPago;
        this.notificacionEnviada = notificacionEnviada;
        this.Observaciones = Observaciones;
        this.fechaCambio = fechaCambio;
        this.estado = estado;
    }

    public int getCodigoEstadoPago() {
        return codigoEstadoPago;
    }

    public void setCodigoEstadoPago(int codigoEstadoPago) {
        this.codigoEstadoPago = codigoEstadoPago;
    }

    public Boolean getNotificacionEnviada() {
        return notificacionEnviada;
    }

    public void setNotificacionEnviada(Boolean notificacionEnviada) {
        this.notificacionEnviada = notificacionEnviada;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    public Date getFechaCambio() {
        return fechaCambio;
    }

    public void setFechaCambio(Date fechaCambio) {
        this.fechaCambio = fechaCambio;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
}
