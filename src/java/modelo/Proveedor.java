package modelo;
/**
 *
 * @author Diego Molina
 */
public class Proveedor {
    private int codigoProveedor;
    private String nombreEmpresa;
    private String descripcionServicios;
    private String telefono;
    private String direccion;
    private String email;
    private Double calificacionPromedio;
    private Boolean estado;

    public Proveedor() {
    }

    public Proveedor(int codigoProveedor, String nombreEmpresa, String descripcionServicios, String telefono, String direccion, String email, Double calificacionPromedio, Boolean estado) {
        this.codigoProveedor = codigoProveedor;
        this.nombreEmpresa = nombreEmpresa;
        this.descripcionServicios = descripcionServicios;
        this.telefono = telefono;
        this.direccion = direccion;
        this.email = email;
        this.calificacionPromedio = calificacionPromedio;
        this.estado = estado;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getDescripcionServicios() {
        return descripcionServicios;
    }

    public void setDescripcionServicios(String descripcionServicios) {
        this.descripcionServicios = descripcionServicios;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Double getCalificacionPromedio() {
        return calificacionPromedio;
    }

    public void setCalificacionPromedio(Double calificacionPromedio) {
        this.calificacionPromedio = calificacionPromedio;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    

}
