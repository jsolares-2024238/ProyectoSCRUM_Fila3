/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Louis Xiloj
 */
public class Disponibilidad {
    private int codigoDisponibilidad;
    private int cuposDisponibles;
    private Date fecha;
    private Time horaInicio;
    private Time horaFin;
    private Boolean estado;

    public Disponibilidad() {
    }

    public Disponibilidad(int codigoDisponibilidad, int cuposDisponibles, Date fecha, Time horaInicio, Time horaFin, Boolean estado) {
        this.codigoDisponibilidad = codigoDisponibilidad;
        this.cuposDisponibles = cuposDisponibles;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.estado = estado;
    }

    public int getCodigoDisponibilidad() {
        return codigoDisponibilidad;
    }

    public void setCodigoDisponibilidad(int codigoDisponibilidad) {
        this.codigoDisponibilidad = codigoDisponibilidad;
    }

    public int getCuposDisponibles() {
        return cuposDisponibles;
    }

    public void setCuposDisponibles(int cuposDisponibles) {
        this.cuposDisponibles = cuposDisponibles;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
     
    
    
    
    
    
    
}
