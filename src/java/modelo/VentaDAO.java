package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List<Venta> listar() {
        String sql = "select * from Venta";
        List<Venta> listaVenta = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Venta venta = new Venta();
                venta.setCodigoVenta(rs.getInt("codigoVenta"));
                venta.setComision(rs.getDouble("comision"));
                venta.setObservaciones(rs.getString("observaciones"));
                venta.setFechaVenta(rs.getDate("fechaVenta"));
                venta.setDescuento(rs.getDouble("descuento"));
                venta.setEstado(rs.getBoolean("estado"));
                venta.setCodigoServicio(rs.getInt("codigoServicio"));
                listaVenta.add(venta);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return listaVenta;
    }

    public int agregar(Venta vent) {
        String sql = "insert into Venta(comision, observaciones, fechaVenta, descuento, estado, codigoServicio) values(?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, vent.getComision());
            ps.setString(2, vent.getObservaciones());
            ps.setDate(3, (Date) vent.getFechaVenta());
            ps.setDouble(4, vent.getDescuento());
            ps.setBoolean(5, vent.getEstado());
            ps.setInt(6, vent.getCodigoServicio());
            resp = ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    
    public Venta listarCodigoVenta(int id) {
    Venta venta = new Venta();
    String sql = "Select * from Venta where codigoVenta ="+ id;
    try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        while(rs.next()) {
            venta.setCodigoVenta(rs.getInt(1));
            venta.setComision(rs.getDouble(2));
            venta.setObservaciones(rs.getString(3));
            venta.setFechaVenta(rs.getDate(4));
            venta.setDescuento(rs.getDouble(5));
            venta.setEstado(rs.getBoolean(6));
            venta.setCodigoServicio(rs.getInt(7));
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
    return venta;
}

    public int actualizar(Venta venta) {
        String sql = "Update Venta set comision = ?, observaciones = ?, fechaVenta = ?, descuento = ?, estado = ?, codigoServicio = ? where codigoVenta = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, venta.getComision());
            ps.setString(2, venta.getObservaciones());
            ps.setDate(3, (Date) venta.getFechaVenta());
            ps.setDouble(4, venta.getDescuento());
            ps.setBoolean(5, venta.getEstado());
            ps.setInt(6, venta.getCodigoServicio());
            ps.setInt(7, venta.getCodigoVenta());
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id) {
    String sql = "delete from Venta where codigoVenta = " + id;
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.executeUpdate();
    } catch(Exception e) {
        e.printStackTrace();
     }
    }
}
