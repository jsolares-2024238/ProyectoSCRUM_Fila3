package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class DetalleVentaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar() {
        String sql = "select * from DetalleVenta";
        List<DetalleVenta> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                DetalleVenta detalle = new DetalleVenta();
                detalle.setCodigoDetalleVenta(rs.getInt(1));
                detalle.setObservaciones(rs.getString(2));
                detalle.setFechaServicio(rs.getDate(3));
                detalle.setPrecioUnitario(rs.getDouble(4));
                detalle.setCantidad(rs.getInt(5));
                detalle.setEstado(rs.getBoolean(6));
                detalle.setCodigoVenta(rs.getInt(7));
                detalle.setCodigoCliente(rs.getInt(8));
                lista.add(detalle);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public int agregar(DetalleVenta detalle) {
        String sql = "insert into DetalleVenta(observaciones, fechaServicio, precioluntario, cantidad, estado, codigoVenta, codigoCliente) values(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, detalle.getObservaciones());
            ps.setDate(2, (Date) detalle.getFechaServicio());
            ps.setDouble(3, detalle.getPrecioUnitario());
            ps.setInt(4, detalle.getCantidad());
            ps.setBoolean(5, detalle.getEstado());
            ps.setInt(6, detalle.getCodigoVenta());
            ps.setInt(7, detalle.getCodigoCliente());
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

       public DetalleVenta buscar(int codigoDetalleVenta) {
        DetalleVenta detalle = new DetalleVenta();
        String sql = "select * from DetalleVenta where codigoDetalleVenta = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoDetalleVenta);
            rs = ps.executeQuery();
            while(rs.next()) {
                detalle.setCodigoDetalleVenta(rs.getInt(1));
                detalle.setObservaciones(rs.getString(2));
                detalle.setFechaServicio(rs.getDate(3));
                detalle.setPrecioUnitario(rs.getDouble(4));
                detalle.setCantidad(rs.getInt(5));
                detalle.setEstado(rs.getBoolean(6));
                detalle.setCodigoVenta(rs.getInt(7));
                detalle.setCodigoCliente(rs.getInt(8));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return detalle;
    }
       
    public int actualizar(DetalleVenta detalle) {
        String sql = "update DetalleVenta set observaciones = ?, fechaServicio = ?, precioluntario = ?, cantidad = ?, codigoVenta = ?, codigoCliente = ? where codigoDetalleVenta = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, detalle.getObservaciones());
            ps.setDate(2, new java.sql.Date(detalle.getFechaServicio().getTime()));
            ps.setDouble(3, detalle.getPrecioUnitario());
            ps.setInt(4, detalle.getCantidad());
            ps.setInt(5, detalle.getCodigoVenta());
            ps.setInt(6, detalle.getCodigoCliente());
            ps.setInt(7, detalle.getCodigoDetalleVenta());
            resp = ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id) {
    String sql = "delete from DetalleVenta where codigoDetalleVenta =" + id;
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.executeUpdate();
    } catch(Exception e) {
        e.printStackTrace();
    }
}

    
   
}