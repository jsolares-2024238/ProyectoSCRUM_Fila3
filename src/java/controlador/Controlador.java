/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Compra;
import modelo.CompraDAO;
import modelo.Destino;
import modelo.DestinoDAO;
import modelo.DetalleCompra;
import modelo.DetalleCompraDAO;
import modelo.DetalleVenta;
import modelo.DetalleVentaDAO;
import modelo.Disponibilidad;
import modelo.DisponibilidadDAO;
import modelo.EstadoPago;
import modelo.EstadoPagoDAO;
import modelo.MetodoPago;
import modelo.MetodoPagoDAO;
import modelo.Pago;
import modelo.PagoDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import modelo.Servicio;
import modelo.ServicioDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.Venta;
import modelo.VentaDAO;

/**
 *
 * @author informatica
 */
public class Controlador extends HttpServlet{
    
    Proveedor proveedor = new Proveedor();
    ProveedorDAO proveedorDao = new ProveedorDAO();
    Compra compra = new Compra();
    CompraDAO compraDao = new CompraDAO();
    DetalleCompra detalleCompra = new DetalleCompra();
    DetalleCompraDAO detalleCompraDao = new DetalleCompraDAO();
    Disponibilidad disponibilidad = new Disponibilidad();
    DisponibilidadDAO disponibilidadDao = new DisponibilidadDAO();
    Servicio servicio = new Servicio();
    ServicioDAO servicioDao = new ServicioDAO();
    Destino destino = new Destino();
    DestinoDAO destinoDao = new DestinoDAO();
    Cliente cliente = new Cliente();
    ClienteDAO clienteDao = new ClienteDAO();
    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDao = new UsuarioDAO();
    Venta venta = new Venta();
    VentaDAO ventaDao = new VentaDAO();
    DetalleVenta detalleVenta = new DetalleVenta();
    DetalleVentaDAO detalleVentaDao = new DetalleVentaDAO();
    MetodoPago metodoPago = new MetodoPago();
    MetodoPagoDAO metodoPagoDao = new MetodoPagoDAO();
    Pago pago = new Pago();
    PagoDAO pagoDao = new PagoDAO();
    EstadoPago estadoPago = new EstadoPago();
    EstadoPagoDAO estadoPagoDao = new EstadoPagoDAO();
    
    int codEstadoPago;
    int codProveedor;
    int codCompra;
    int codDetalleCompra;
    int codDisponibilidad;
    int codServicio;
    int codDestino;
    int codCliente;
    int codUsuario;
    int codVenta;
    int codDetalleVenta;
    int codMetodoPago;
    int codPago;
    
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if(menu.equals("Principal")){
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }else if(menu.equals("Entidades")){
            request.getRequestDispatcher("Entidades.jsp").forward(request, response);
        }else if(menu.equals("Proveedor")){
            switch(accion){
                case "Listar":
                    List listaProveedor = proveedorDao.listar();
                    request.setAttribute("Proveedores", listaProveedor);
                    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nomemp = (request.getParameter("txtNombreEmpresa"));
                    String desser = request.getParameter("txtDescripcion");
                    String tel = (request.getParameter("txtTelefono")); 
                    String dire = (request.getParameter("txtDireccion"));
                    String email = (request.getParameter("txtEmail"));
                    Double calpro = Double.parseDouble(request.getParameter("txtCalificacion"));
                    Boolean est = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    proveedor.setNombreEmpresa(nomemp);
                    proveedor.setDescripcionServicios(desser);
                    proveedor.setTelefono(tel);
                    proveedor.setDireccion(dire);
                    proveedor.setEmail(email);
                    proveedor.setCalificacionPromedio(calpro);
                    proveedor.setEstado(est);
                    proveedorDao.agregar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
                    Proveedor pro = proveedorDao.listarCodigoProveedor(codProveedor);
                    request.setAttribute("proveedor", pro);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nomempr = (request.getParameter("txtNombreEmpresa"));
                    String descser = request.getParameter("txtDescripcion");
                    String tele = (request.getParameter("txtTelefono")); 
                    String dir = (request.getParameter("txtDireccion"));
                    String ema = (request.getParameter("txtEmail"));
                    Double calipro = Double.parseDouble(request.getParameter("txtCalificacion"));
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    proveedor.setNombreEmpresa(nomempr);
                    proveedor.setDescripcionServicios(descser);
                    proveedor.setTelefono(tele);
                    proveedor.setDireccion(dir);
                    proveedor.setEmail(ema);
                    proveedor.setCalificacionPromedio(calipro);
                    proveedor.setEstado(esta);
                    proveedorDao.actualizar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
                    proveedorDao.eliminar(codProveedor);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
        }else if (menu.equals("Compra")){
            switch(accion){
                case "Listar":
                    List listaCompra = compraDao.listar();
                    request.setAttribute("compras", listaCompra);
                    request.getRequestDispatcher("Compra.jsp").forward(request, response);
                    break;
                case "Agregar":
                    double tot = Double.parseDouble(request.getParameter("txtTotal"));
                    String obser = request.getParameter("txtObservacionesCompras");
                    Date fec = Date.valueOf(request.getParameter("txtFechaCompra")); 
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstadoCompra"));
                    int codProveedor = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    compra.setTotal(tot);
                    compra.setObservaciones(obser);
                    compra.setFechaCompra(fec);
                    compra.setEstado(esta);
                    compra.setCodigoProveedor(codProveedor);
                    compraDao.agregar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codCompra = Integer.parseInt(request.getParameter("codigoCompra"));
                    Compra comp = compraDao.listarCodigoCompra(codCompra);
                    request.setAttribute("compra", comp);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    double tota = Double.parseDouble(request.getParameter("txtTotal"));
                    String observa = request.getParameter("txtObservacionesCompras");
                    Date fecCom = Date.valueOf(request.getParameter("txtFechaCompra")); 
                    Boolean estad = Boolean.parseBoolean(request.getParameter("txtEstadoCompra"));
                    compra.setTotal(tota);
                    compra.setObservaciones(observa);
                    compra.setFechaCompra(fecCom);
                    compra.setEstado(estad);
                    compra.setCodigoCompra(codCompra);
                    compraDao.actualizar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCompra = Integer.parseInt(request.getParameter("codigoCompra"));
                    compraDao.eliminar(codCompra);
                    request.getRequestDispatcher("Controlador?menu=Compra&accion=Listar").forward(request, response);
                    break;
            }
        }else if (menu.equals("DetalleCompra")){
            switch(accion){
                case "Listar":
                    List listaDetalleCompra = detalleCompraDao.listar();
                    request.setAttribute("detalleCompras", listaDetalleCompra);
                    request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String detObs = request.getParameter("txtObservacionesDetalleCompra");
                    Date detFec = Date.valueOf(request.getParameter("txtDetalleFechaServicio")); 
                    double preUni = Double.parseDouble(request.getParameter("txtPrecioUnitario"));
                    int detCant = Integer.parseInt(request.getParameter("txtDetalleCantidad"));
                    Boolean est = Boolean.parseBoolean(request.getParameter("txtDetalleEstadoCompra"));
                    int detCodCompra = Integer.parseInt(request.getParameter("txtDetCodigoCompra"));
                    int detCodProveedor = Integer.parseInt(request.getParameter("txtDetCodigoProveedor"));
                    detalleCompra.setObservaciones(detObs);
                    detalleCompra.setFechaServicio(detFec);
                    detalleCompra.setPrecioUnitario(preUni);
                    detalleCompra.setCantidad(detCant);
                    detalleCompra.setEstado(est);
                    detalleCompra.setCodigoCompra(detCodCompra);
                    detalleCompra.setCodigoProveedor(detCodProveedor);
                    detalleCompraDao.agregar(detalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("codigoDetalleCompra"));
                    DetalleCompra detComp = detalleCompraDao.listarCodigoDetalleCompra(codDetalleCompra);
                    request.setAttribute("detalleCompra", detComp);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String detObser = request.getParameter("txtObservacionesDetalleCompra");
                    Date detFecSer = Date.valueOf(request.getParameter("txtDetalleFechaServicio")); 
                    double preUnita = Double.parseDouble(request.getParameter("txtPrecioUnitario"));
                    int detCantid = Integer.parseInt(request.getParameter("txtDetalleCantidad"));
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtDetalleEstadoCompra"));
                    detalleCompra.setObservaciones(detObser);
                    detalleCompra.setFechaServicio(detFecSer);
                    detalleCompra.setPrecioUnitario(preUnita);
                    detalleCompra.setCantidad(detCantid);
                    detalleCompra.setEstado(esta);
                    detalleCompra.setCodigoDetalleCompra(codDetalleCompra);
                    detalleCompraDao.actualizar(detalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("codigoDetalleCompra"));
                    detalleCompraDao.eliminar(codDetalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
            }
        }else if (menu.equals("Disponibilidad")){
            switch(accion){
                case "Listar":
                    List listaDisponibilidad = disponibilidadDao.listar();
                    request.setAttribute("disponibilidades", listaDisponibilidad);
                    request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String cupdisStr = request.getParameter("txtCuposDisponibles");
                    String fechaStr = request.getParameter("txtFecha");
                    String horaIniStr = request.getParameter("txtHoraInicio");
                    String horaFinStr = request.getParameter("txtHoraFin");
                    String estStr = request.getParameter("txtEstado");
                    if (cupdisStr == null || cupdisStr.isEmpty() ||fechaStr == null || fechaStr.isEmpty() ||horaIniStr == null || horaIniStr.isEmpty() ||horaFinStr == null || horaFinStr.isEmpty() ||estStr == null || estStr.isEmpty()) {
                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("disponibilidades", disponibilidadDao.listar());
                        request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
                        return;
                    }else if(!estStr.equalsIgnoreCase("true") && !estStr.equalsIgnoreCase("false")) {
                        request.setAttribute("estadoInvalido", "El campo Estado solo puede ser true o false.");
                        request.setAttribute("disponibilidades", disponibilidadDao.listar());
                        request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
                        return;
                    }
                        int cupdis = Integer.parseInt(cupdisStr);
                        Date fech = Date.valueOf(fechaStr);
                        Time hIni = Time.valueOf(horaIniStr);
                        Time hFin = Time.valueOf(horaFinStr);
                        Boolean est = Boolean.parseBoolean(estStr);
                        disponibilidad.setCuposDisponibles(cupdis);
                        disponibilidad.setFecha(fech);
                        disponibilidad.setHoraInicio(hIni);
                        disponibilidad.setHoraFin(hFin);
                        disponibilidad.setEstado(est);
                        disponibilidadDao.agregar(disponibilidad);
                        request.getRequestDispatcher("Controlador?menu=Disponibilidad&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codDisponibilidad = Integer.parseInt(request.getParameter("codigoDisponibilidad"));
                    Disponibilidad disp = disponibilidadDao.listarCodigoDisponibilidad(codDisponibilidad);
                    request.setAttribute("disponibilidad", disp);
                    request.getRequestDispatcher("Controlador?menu=Disponibilidad&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String cupdiStr = request.getParameter("txtCuposDisponibles");
                    String fecStr = request.getParameter("txtFecha");
                    String hInStr = request.getParameter("txtHoraInicio");
                    String hFiStr = request.getParameter("txtHoraFin");
                    String esStr = request.getParameter("txtEstado");
                    if (cupdiStr == null || cupdiStr.isEmpty() ||fecStr == null || fecStr.isEmpty() ||hInStr == null || hInStr.isEmpty() ||hFiStr == null || hFiStr.isEmpty() ||esStr == null || esStr.isEmpty()) {
                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("disponibilidades", disponibilidadDao.listar());
                        request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
                        return;
                    }else if(!esStr.equalsIgnoreCase("true") && !esStr.equalsIgnoreCase("false")) {
                        request.setAttribute("estadoInvalido", "El campo Estado solo puede ser true o false.");
                        request.setAttribute("disponibilidades", disponibilidadDao.listar());
                        request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
                        return;
                    }
                    int cupdi = Integer.parseInt(cupdiStr);
                    Date fec = Date.valueOf(fecStr);
                    Time hIn = Time.valueOf(hInStr);
                    Time hFi = Time.valueOf(hFiStr);
                    Boolean es = Boolean.parseBoolean(esStr);
                    disponibilidad.setCuposDisponibles(cupdi);
                    disponibilidad.setFecha(fec);
                    disponibilidad.setHoraInicio(hIn);
                    disponibilidad.setHoraFin(hFi);
                    disponibilidad.setEstado(es);
                    disponibilidad.setCodigoDisponibilidad(codDisponibilidad);
                    disponibilidadDao.actualizar(disponibilidad);
                    request.getRequestDispatcher("Controlador?menu=Disponibilidad&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codDisponibilidad = Integer.parseInt(request.getParameter("codigoDisponibilidad"));
                    disponibilidadDao.eliminar(codDisponibilidad);
                    request.getRequestDispatcher("Controlador?menu=Disponibilidad&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Disponibilidad.jsp").forward(request, response);
        }else if(menu.equals("Servicio")){
            switch(accion){
                case "Listar":
                    List listaServicio = servicioDao.listar();
                    request.setAttribute("servicios", listaServicio);
                    request.getRequestDispatcher("Servicio.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nomb = request.getParameter("txtNombre");
                    String tiDeServ = request.getParameter("txtTipoDeServicio");
                    String desc = request.getParameter("txtDescripcion");
                    String capMaStr = request.getParameter("txtCapacidadMaxima");
                    String incl = request.getParameter("txtIncluye");
                    String preStr = request.getParameter("txtPrecio");
                    String dura = request.getParameter("txtDuracion");
                    String estaStr = request.getParameter("txtEstado");
                    String codCompStr = request.getParameter("txtCodigoCompra");
                    String codDispoStr = request.getParameter("txtCodigoDisponibilidad");
                    if (nomb == null || nomb.isEmpty() ||tiDeServ == null || tiDeServ.isEmpty() ||desc == null || desc.isEmpty() ||capMaStr == null || capMaStr.isEmpty() ||incl == null || incl.isEmpty() ||preStr == null || preStr.isEmpty() ||dura == null || dura.isEmpty() ||estaStr == null || estaStr.isEmpty() ||codCompStr == null || codCompStr.isEmpty() ||codDispoStr == null || codDispoStr.isEmpty()) {
                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("servicios", servicioDao.listar());
                        request.getRequestDispatcher("Servicio.jsp").forward(request, response);
                        return;
                    }
                    if (!estaStr.equalsIgnoreCase("true") && !estaStr.equalsIgnoreCase("false")) {
                        request.setAttribute("estadoInvalido", "El campo Estado solo puede ser true o false.");
                        request.setAttribute("servicios", servicioDao.listar());
                        request.getRequestDispatcher("Servicio.jsp").forward(request, response);
                        return;
                    }
                    int capMa = Integer.parseInt(capMaStr);
                    double pre = Double.parseDouble(preStr);
                    Boolean esta = Boolean.parseBoolean(estaStr);
                    int codComp = Integer.parseInt(codCompStr);
                    int codDispo = Integer.parseInt(codDispoStr);
                    servicio.setNombre(nomb);
                    servicio.setTipoDeServicio(tiDeServ);
                    servicio.setDescripcion(desc);
                    servicio.setCapacidadMaxima(capMa);
                    servicio.setIncluye(incl);
                    servicio.setPrecio(pre);
                    servicio.setDuracion(dura);
                    servicio.setEstado(esta);
                    servicio.setCodigoCompra(codComp);
                    servicio.setCodigoDisponibilidad(codDispo);
                    servicioDao.agregar(servicio);
                    request.getRequestDispatcher("Controlador?menu=Servicio&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                    Servicio serv = servicioDao.listarCodigoServicio(codServicio);
                    request.setAttribute("servicio", serv);
                    request.getRequestDispatcher("Controlador?menu=Servicio&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nom = request.getParameter("txtNombre");
                    String tiDeSer = request.getParameter("txtTipoDeServicio");
                    String des = request.getParameter("txtDescripcion");
                    String capMStr = request.getParameter("txtCapacidadMaxima");
                    String inc = request.getParameter("txtIncluye");
                    String prStr = request.getParameter("txtPrecio");
                    String dur = request.getParameter("txtDuracion");
                    String estStr = request.getParameter("txtEstado");

                    if (nom == null || nom.isEmpty() ||tiDeSer == null || tiDeSer.isEmpty() ||des == null || des.isEmpty() ||capMStr == null || capMStr.isEmpty() ||inc == null || inc.isEmpty() ||prStr == null || prStr.isEmpty() ||dur == null || dur.isEmpty() ||estStr == null || estStr.isEmpty()) {
                        request.setAttribute("vacio", "No se pueden dejar campos vacíos. Inténtelo de nuevo.");
                        request.setAttribute("servicios", servicioDao.listar());
                        request.getRequestDispatcher("Servicio.jsp").forward(request, response);
                        return;
                    }
                    if (!estStr.equalsIgnoreCase("true") && !estStr.equalsIgnoreCase("false")) {
                        request.setAttribute("estadoInvalido", "El campo Estado solo puede ser true o false.");
                        request.setAttribute("servicios", servicioDao.listar());
                        request.getRequestDispatcher("Servicio.jsp").forward(request, response);
                        return;
                    }
                    int capM = Integer.parseInt(capMStr);
                    double pr = Double.parseDouble(prStr);
                    Boolean est = Boolean.parseBoolean(estStr);
                    servicio.setNombre(nom);
                    servicio.setTipoDeServicio(tiDeSer);
                    servicio.setDescripcion(des);
                    servicio.setCapacidadMaxima(capM);
                    servicio.setIncluye(inc);
                    servicio.setPrecio(pr);
                    servicio.setDuracion(dur);
                    servicio.setEstado(est);
                    servicio.setCodigoServicio(codServicio);
                    servicioDao.actualizar(servicio);
                    request.getRequestDispatcher("Controlador?menu=Servicio&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                    servicioDao.eliminar(codServicio);
                    request.getRequestDispatcher("Controlador?menu=Servicio&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Servicio.jsp").forward(request, response);
        }else if(menu.equals("Destino")){
            switch(accion){
                case "Listar":
                    List listaDestino = destinoDao.listar();
                    request.setAttribute("destinos", listaDestino);
                    request.getRequestDispatcher("Destino.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nombre = request.getParameter("txtNombre");
                    String descripcion = request.getParameter("txtDescripcion");
                    String pais = request.getParameter("txtPais");
                    String ciudad = request.getParameter("txtCiudad");
                    String informacionTuristica = request.getParameter("txtInformacionTuristica");
                    String clima = request.getParameter("txtClima");
                    String mejorEpocaVisita = request.getParameter("txtMejorEpocaVisita");
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    int codigoServicio = Integer.parseInt(request.getParameter("txtCodigoServicio"));
                    destino.setNombre(nombre);
                    destino.setDescripcion(descripcion);
                    destino.setPais(pais);
                    destino.setCiudad(ciudad);
                    destino.setInformacionTuristica(informacionTuristica);
                    destino.setClima(clima);
                    destino.setMejorEpocaVisita(mejorEpocaVisita);
                    destino.setEstado(esta);
                    destino.setCodigoServicio(codigoServicio);
                    destinoDao.agregar(destino);
                    request.getRequestDispatcher("Controlador?menu=Destino&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codDestino = Integer.parseInt(request.getParameter("codigoDestino"));
                    Destino des = destinoDao.listarCodigoDestino(codDestino);
                    request.setAttribute("destino", des);
                    request.getRequestDispatcher("Controlador?menu=Destino&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombr = request.getParameter("txtNombre");
                    String descrip = request.getParameter("txtDescripcion");
                    String pai = request.getParameter("txtPais");
                    String ciu = request.getParameter("txtCiudad");
                    String infoTuristica = request.getParameter("txtInformacionTuristica");
                    String cli = request.getParameter("txtClima");
                    String mejorEpoVisita = request.getParameter("txtMejorEpocaVisita");
                    Boolean est = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    destino.setNombre(nombr);
                    destino.setDescripcion(descrip);
                    destino.setPais(pai);
                    destino.setCiudad(ciu);
                    destino.setInformacionTuristica(infoTuristica);
                    destino.setClima(cli);
                    destino.setMejorEpocaVisita(mejorEpoVisita);
                    destino.setEstado(est);
                    destino.setCodigoDestino(codDestino);
                    destinoDao.actualizar(destino);
                    request.getRequestDispatcher("Controlador?menu=Destino&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codDestino = Integer.parseInt(request.getParameter("codigoDestino"));
                    destinoDao.eliminar(codDestino);
                    request.getRequestDispatcher("Controlador?menu=Destino&accion=Listar").forward(request, response);
                    break;
            }        
            request.getRequestDispatcher("Destino.jsp").forward(request, response);
        }else if(menu.equals("Cliente")){
            switch(accion){
                case "Listar":
                    List listaCliente = clienteDao.listar();
                    request.setAttribute("Clientes", listaCliente);
                    request.getRequestDispatcher("Cliente.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nomb = request.getParameter("txtNombre");
                    String apell = request.getParameter("txtApellido");
                    String tel = request.getParameter("txtTelefono");
                    String ema = request.getParameter("txtEmail");
                    String dire = request.getParameter("txtDireccion");
                    Date fechre = Date.valueOf(request.getParameter("txtFechaRegistro"));
                    Boolean est = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    cliente.setNombre(nomb);
                    cliente.setApellido(apell);
                    cliente.setTelefono(tel);
                    cliente.setEmail(ema);
                    cliente.setDireccion(dire);
                    cliente.setFechaRegistro(fechre);
                    cliente.setEstado(est);
                    clienteDao.agregar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    Cliente cli = clienteDao.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", cli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombr = request.getParameter("txtNombre");
                    String apelli = request.getParameter("txtApellido");
                    String tele = request.getParameter("txtTelefono");
                    String emai = request.getParameter("txtEmail");
                    String direc = request.getParameter("txtDireccion");
                    Date fechreg = Date.valueOf(request.getParameter("txtFechaRegistro"));
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    cliente.setNombre(nombr);
                    cliente.setApellido(apelli);
                    cliente.setTelefono(tele);
                    cliente.setEmail(emai);
                    cliente.setDireccion(direc);
                    cliente.setFechaRegistro(fechreg);
                    cliente.setEstado(esta);
                    cliente.setCodigoCliente(codCliente);
                    clienteDao.actualizar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    clienteDao.eliminar(codCliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
            }        
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        }else if(menu.equals("Usuario")){
            switch(accion){
                case "Listar":
                    List listaUsuario = usuarioDao.listar();
                    request.setAttribute("Usuarios", listaUsuario);
                    request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                    break;
                case "Agregar":
                    String nomb = request.getParameter("txtNombreUsuario");
                    String cont = request.getParameter("txtContrasenia");
                    String ro = request.getParameter("txtRol");
                    String estadoStr = request.getParameter("txtEstado");
                    boolean estados = "1".equals(estadoStr) || "true".equalsIgnoreCase(estadoStr);
                    Integer codCli = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    usuario.setNombreUsuario(nomb);
                    usuario.setContrasenia(cont);
                    usuario.setRol(ro);
                    usuario.setEstado(estados);
                    usuario.setCodigoCliente(codCli);
                    usuarioDao.agregar(usuario);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codUsuario = Integer.parseInt(request.getParameter("codigoUsuario"));
                    Usuario user = usuarioDao.listarCodigoUsuario(codUsuario);
                    request.setAttribute("usuario", user);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombr = request.getParameter("txtNombreUsuario");
                    String contr = request.getParameter("txtContrasenia");
                    String rol = request.getParameter("txtRol");
                    String estadoStrg = request.getParameter("txtEstado");
                    boolean estad = "1".equals(estadoStrg) || "true".equalsIgnoreCase(estadoStrg);
                    Integer codClie = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    usuario.setNombreUsuario(nombr);
                    usuario.setContrasenia(contr);
                    usuario.setRol(rol);
                    usuario.setEstado(estad);
                    usuario.setCodigoUsuario(codUsuario);
                    usuarioDao.actualizar(usuario);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codUsuario = Integer.parseInt(request.getParameter("codigoUsuario"));
                    usuarioDao.eliminar(codUsuario);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
            }        
            request.getRequestDispatcher("Usuario.jsp").forward(request, response);
        }else if (menu.equals("Venta")) {
            switch (accion) {
                case "Listar":
                    List listaVenta = ventaDao.listar();
                    request.setAttribute("Ventas", listaVenta);
                    request.getRequestDispatcher("Venta.jsp").forward(request, response);
                    break;

                case "Agregar":
                    Double comision = Double.parseDouble(request.getParameter("txtComision"));
                    String obs = request.getParameter("txtObservaciones");
                    Date fechaVenta = Date.valueOf(request.getParameter("txtFechaVenta"));
                    Double descuento = Double.parseDouble(request.getParameter("txtDescuento"));
                    Boolean estado = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    int codServicio = Integer.parseInt(request.getParameter("txtCodigoServicio"));
                    venta.setComision(comision);
                    venta.setObservaciones(obs);
                    venta.setFechaVenta(fechaVenta);
                    venta.setDescuento(descuento);
                    venta.setEstado(estado);
                    venta.setCodigoServicio(codServicio);
                    ventaDao.agregar(venta);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    codVenta = Integer.parseInt(request.getParameter("codigoVenta"));
                    Venta v = ventaDao.listarCodigoVenta(codVenta);
                    request.setAttribute("venta", v);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    Double com = Double.parseDouble(request.getParameter("txtComision"));
                    String obsv = request.getParameter("txtObservaciones");
                    Date fechaV = Date.valueOf(request.getParameter("txtFechaVenta"));
                    Double desc = Double.parseDouble(request.getParameter("txtDescuento"));
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    venta.setComision(com);
                    venta.setObservaciones(obsv);
                    venta.setFechaVenta(fechaV);
                    venta.setDescuento(desc);
                    venta.setEstado(esta);
                    venta.setCodigoVenta(codVenta);
                    ventaDao.actualizar(venta);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    int codVen = Integer.parseInt(request.getParameter("codigoVenta"));
                    ventaDao.eliminar(codVen);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Venta.jsp").forward(request, response);
            
        }else if (menu.equals("DetalleVenta")) {
            switch (accion) {
                case "Listar":
                    List listaDetalleVenta = detalleVentaDao.listar();
                    request.setAttribute("detalleVentas", listaDetalleVenta);
                    request.getRequestDispatcher("DetalleVenta.jsp").forward(request, response);
                    break;

                case "Agregar":
                    String observ = request.getParameter("txtObservaciones");
                    Date fechaServ = Date.valueOf(request.getParameter("txtFechaServicio"));
                    Double precio = Double.parseDouble(request.getParameter("txtPrecioUnitario"));
                    int cant = Integer.parseInt(request.getParameter("txtCantidad"));
                    Boolean estado = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    int codVen = Integer.parseInt(request.getParameter("txtCodigoVenta"));
                    int codCli = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    detalleVenta.setObservaciones(observ);
                    detalleVenta.setFechaServicio(fechaServ);
                    detalleVenta.setPrecioUnitario(precio);
                    detalleVenta.setCantidad(cant);
                    detalleVenta.setEstado(estado);
                    detalleVenta.setCodigoVenta(codVen);
                    detalleVenta.setCodigoCliente(codCli);
                    detalleVentaDao.agregar(detalleVenta);
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    int codDet = Integer.parseInt(request.getParameter("codigoDetalleVenta"));
                    DetalleVenta dv = detalleVentaDao.buscar(codDet);
                    request.setAttribute("detalleVenta", dv);
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    String observA = request.getParameter("txtObservaciones");
                    Date fechaS = Date.valueOf(request.getParameter("txtFechaServicio"));
                    Double precioU = Double.parseDouble(request.getParameter("txtPrecioUnitario"));
                    int cantA = Integer.parseInt(request.getParameter("txtCantidad"));
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    int codDeta = Integer.parseInt(request.getParameter("txtCodigoDetalleVenta"));
                    detalleVenta.setObservaciones(observA);
                    detalleVenta.setFechaServicio(fechaS);
                    detalleVenta.setPrecioUnitario(precioU);
                    detalleVenta.setCantidad(cantA);
                    detalleVenta.setEstado(esta);
                    detalleVenta.setCodigoDetalleVenta(codDeta);
                    detalleVentaDao.actualizar(detalleVenta);
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    int codDetV = Integer.parseInt(request.getParameter("codigoDetalleVenta"));
                    detalleVentaDao.eliminar(codDetV);
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("DetalleVenta.jsp").forward(request, response);
        }else if (menu.equals("MetodoPago")) {
            switch (accion) {
            case "Listar":
                List listaMetodoPago = metodoPagoDao.listar();
                request.setAttribute("metodoPagos", listaMetodoPago);
                request.getRequestDispatcher("MetodoPago.jsp").forward(request, response);
                break;

            case "Agregar":
                metodoPago.setNombre(request.getParameter("txtNombre"));
                metodoPago.setDescripcion(request.getParameter("txtDescripcion"));
                metodoPago.setComision(Double.parseDouble(request.getParameter("txtComision")));
                metodoPago.setTipo(request.getParameter("txtTipo"));
                metodoPago.setEstado(Boolean.parseBoolean(request.getParameter("txtEstado")));
                metodoPagoDao.agregar(metodoPago);
                request.getRequestDispatcher("Controlador?menu=MetodoPago&accion=Listar").forward(request, response);
                break;

            case "Editar":
                codMetodoPago = Integer.parseInt(request.getParameter("codigoMetodoPago"));
                MetodoPago mp = metodoPagoDao.listarCodigoMetodoPago(codMetodoPago);
                request.setAttribute("metodoPago", mp);
                request.getRequestDispatcher("MetodoPago.jsp").forward(request, response);
                break;

            case "Actualizar":
                metodoPago.setCodigoMetodoPago(Integer.parseInt(request.getParameter("codigoMetodoPago")));
                metodoPago.setNombre(request.getParameter("txtNombre"));
                metodoPago.setDescripcion(request.getParameter("txtDescripcion"));
                metodoPago.setComision(Double.parseDouble(request.getParameter("txtComision")));
                metodoPago.setTipo(request.getParameter("txtTipo"));
                metodoPagoDao.actualizar(metodoPago);
                request.getRequestDispatcher("Controlador?menu=MetodoPago&accion=Listar").forward(request, response);
                break;

            case "Eliminar":
                codMetodoPago = Integer.parseInt(request.getParameter("codigoMetodoPago"));
                metodoPagoDao.eliminar(codMetodoPago);
                request.getRequestDispatcher("Controlador?menu=MetodoPago&accion=Listar").forward(request, response);
                break;
            }
            
            request.getRequestDispatcher("MetodoPago.jsp").forward(request, response);
        }else if(menu.equals("EstadoPago")){
            switch(accion){
                case "Listar":
                    List listaEstadoPago = estadoPagoDao.listar();
                    request.setAttribute("estadoPagos", listaEstadoPago);
                    request.getRequestDispatcher("EstadoPago.jsp").forward(request, response);
                    break;
                case "Agregar":
                    Boolean noti = Boolean.parseBoolean(request.getParameter("txtNotificacionEnviada"));
                    String obs = request.getParameter("txtObservaciones");
                    Date fecha = Date.valueOf(request.getParameter("txtFechaCambio")); 
                    Boolean est = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    estadoPago.setNotificacionEnviada(noti);
                    estadoPago.setObservaciones(obs);
                    estadoPago.setFechaCambio(fecha);
                    estadoPago.setEstado(est);
                    estadoPagoDao.agregar(estadoPago);
                    request.getRequestDispatcher("Controlador?menu=EstadoPago&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codEstadoPago = Integer.parseInt(request.getParameter("codigoEstadoPago"));
                    EstadoPago estpag = estadoPagoDao.listarCodigoEstadoPago(codEstadoPago);
                    request.setAttribute("estadoPago", estpag);
                    request.getRequestDispatcher("Controlador?menu=EstadoPago&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Boolean notienv = Boolean.parseBoolean(request.getParameter("txtNotificacionEnviada"));
                    String obse = request.getParameter("txtObservaciones");
                    Date fechaC = Date.valueOf(request.getParameter("txtFechaCambio")); 
                    Boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    estadoPago.setNotificacionEnviada(notienv);
                    estadoPago.setObservaciones(obse);
                    estadoPago.setFechaCambio(fechaC);
                    estadoPago.setEstado(esta);
                    estadoPago.setCodigoEstadoPago(codEstadoPago);
                    estadoPagoDao.actualizar(estadoPago);
                    request.getRequestDispatcher("Controlador?menu=EstadoPago&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codEstadoPago = Integer.parseInt(request.getParameter("codigoEstadoPago"));
                    estadoPagoDao.eliminar(codEstadoPago);
                    request.getRequestDispatcher("Controlador?menu=EstadoPago&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("EstadoPago.jsp").forward(request, response);
        }else if(menu.equals("Pago")){
            switch(accion){
                case "Listar":
                    List listaPago = pagoDao.listar();
                    request.setAttribute("Pagos", listaPago);
                    request.getRequestDispatcher("Pago.jsp").forward(request, response);
                    break;
                case "Agregar":
                    Double monto = Double.parseDouble(request.getParameter("txtMonto"));
                    String datosValidos = request.getParameter("txtDatosValidos");
                    Date fechaPago = Date.valueOf(request.getParameter("txtFechaPago")); 
                    String observaciones = request.getParameter("txtObservaciones");
                    Boolean estado = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    Integer codigoCompra = Integer.parseInt(request.getParameter("txtCodigoCompra"));
                    Integer codigoVenta = Integer.parseInt(request.getParameter("txtCodigoVenta"));
                    Integer codigoMetodoPago = Integer.parseInt(request.getParameter("txtCodigoMetodoPago"));
                    Integer codigoEstadoPago = Integer.parseInt(request.getParameter("txtCodigoEstadoPago"));
                    pago.setMonto(monto);
                    pago.setDatosValidos(datosValidos);
                    pago.setFechaPago(fechaPago);
                    pago.setObservaciones(observaciones);
                    pago.setEstado(estado);
                    pago.setCodigoCompra(codigoCompra);
                    pago.setCodigoVenta(codigoVenta);
                    pago.setCodigoMetodoPago(codigoMetodoPago);
                    pago.setCodigoEstadoPago(codigoEstadoPago);
                    pagoDao.agregar(pago);
                    request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codPago = Integer.parseInt(request.getParameter("codigoPago"));
                    Pago pg = pagoDao.listarCodigoPago(codPago);
                    request.setAttribute("pago", pg);
                    request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Double montoA = Double.parseDouble(request.getParameter("txtMonto"));
                    String datosValidosA = request.getParameter("txtDatosValidos");
                    Date fechaPagoA = Date.valueOf(request.getParameter("txtFechaPago")); 
                    String observacionesA = request.getParameter("txtObservaciones");
                    Boolean estadoA = Boolean.parseBoolean(request.getParameter("txtEstado"));
                    pago.setMonto(montoA);
                    pago.setDatosValidos(datosValidosA);
                    pago.setFechaPago(fechaPagoA);
                    pago.setObservaciones(observacionesA);
                    pago.setEstado(estadoA);
                    pago.setCodigoPago(codPago);
                    pagoDao.actualizar(pago);
                    request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codPago = Integer.parseInt(request.getParameter("codigoPago"));
                    pagoDao.eliminar(codPago);
                    request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Pago.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
