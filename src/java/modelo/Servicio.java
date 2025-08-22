/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Louis Xiloj
 */
public class Servicio {
    private int codigoServicio;
    private String nombre;
    private String tipoDeServicio;
    private String descripcion;
    private int capacidadMaxima;
    private String incluye;
    private double precio;
    private String duracion;
    private Boolean estado;
    private int codigoCompra;
    private int codigoDisponibilidad;

    public Servicio() {
    }

    public Servicio(int codigoServicio, String nombre, String tipoDeServicio, String descripcion, int capacidadMaxima, String incluye, double precio, String duracion, Boolean estado, int codigoCompra, int codigoDisponibilidad) {
        this.codigoServicio = codigoServicio;
        this.nombre = nombre;
        this.tipoDeServicio = tipoDeServicio;
        this.descripcion = descripcion;
        this.capacidadMaxima = capacidadMaxima;
        this.incluye = incluye;
        this.precio = precio;
        this.duracion = duracion;
        this.estado = estado;
        this.codigoCompra = codigoCompra;
        this.codigoDisponibilidad = codigoDisponibilidad;
    }

    public int getCodigoServicio() {
        return codigoServicio;
    }

    public void setCodigoServicio(int codigoServicio) {
        this.codigoServicio = codigoServicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoDeServicio() {
        return tipoDeServicio;
    }

    public void setTipoDeServicio(String tipoDeServicio) {
        this.tipoDeServicio = tipoDeServicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }

    public void setCapacidadMaxima(int capacidadMaxima) {
        this.capacidadMaxima = capacidadMaxima;
    }

    public String getIncluye() {
        return incluye;
    }

    public void setIncluye(String incluye) {
        this.incluye = incluye;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
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

    public int getCodigoDisponibilidad() {
        return codigoDisponibilidad;
    }

    public void setCodigoDisponibilidad(int codigoDisponibilidad) {
        this.codigoDisponibilidad = codigoDisponibilidad;
    }
    
}
