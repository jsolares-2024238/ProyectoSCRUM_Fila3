package modelo;

public class MetodoPago {
    private int codigoMetodoPago;
    private String nombre;
    private String descripcion;
    private double comision;
    private String tipo;
    private boolean estado;

    public MetodoPago() {}

    public MetodoPago(int codigoMetodoPago, String nombre, String descripcion, double comision, String tipo, boolean estado) {
        this.codigoMetodoPago = codigoMetodoPago;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.comision = comision;
        this.tipo = tipo;
        this.estado = estado;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}
