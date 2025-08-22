package modelo;

/**
 *
 * @author Christian
 */

public class Destino {
    private int codigoDestino;
    private String nombre;
    private String descripcion;
    private String pais;
    private String ciudad;
    private String informacionTuristica;
    private String clima;
    private String mejorEpocaVisita;
    private Boolean estado;
    private int codigoServicio;

    public Destino() {
    }

    public Destino(int codigoDestino, String nombre, String descripcion, String pais, String ciudad, String informacionTuristica, String clima, String mejorEpocaVisita, Boolean estado, int codigoServicio) {
        this.codigoDestino = codigoDestino;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.pais = pais;
        this.ciudad = ciudad;
        this.informacionTuristica = informacionTuristica;
        this.clima = clima;
        this.mejorEpocaVisita = mejorEpocaVisita;
        this.estado = estado;
        this.codigoServicio = codigoServicio;
    }

    public int getCodigoDestino() {
        return codigoDestino;
    }

    public void setCodigoDestino(int codigoDestino) {
        this.codigoDestino = codigoDestino;
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

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getInformacionTuristica() {
        return informacionTuristica;
    }

    public void setInformacionTuristica(String informacionTuristica) {
        this.informacionTuristica = informacionTuristica;
    }

    public String getClima() {
        return clima;
    }

    public void setClima(String clima) {
        this.clima = clima;
    }

    public String getMejorEpocaVisita() {
        return mejorEpocaVisita;
    }

    public void setMejorEpocaVisita(String mejorEpocaVisita) {
        this.mejorEpocaVisita = mejorEpocaVisita;
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
