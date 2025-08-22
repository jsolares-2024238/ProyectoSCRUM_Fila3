package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql="select * from pago";
        List<Pago> listaPago = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Pago pg = new Pago();
                pg.setCodigoPago(rs.getInt(1));
                pg.setMonto(rs.getDouble(2));
                pg.setDatosValidos(rs.getString(3));
                pg.setFechaPago(rs.getDate(4));
                pg.setObservaciones(rs.getString(5));
                pg.setEstado(rs.getBoolean(6));
                pg.setCodigoCompra(rs.getInt(7));
                pg.setCodigoVenta(rs.getInt(8));
                pg.setCodigoMetodoPago(rs.getInt(9));
                pg.setCodigoEstadoPago(rs.getInt(10));
                listaPago.add(pg);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaPago;
    }
    
    //AGREGAR
    public int agregar(Pago pg){
        String sql = "insert into pago (monto, datosValidos, fechaPago, observaciones, estado, codigoCompra, codigoVenta, codigoMetodoPago, codigoEstadoPago) values(?,?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pg.getMonto());
            ps.setString(2, pg.getDatosValidos());
            ps.setDate(3, (Date) pg.getFechaPago());
            ps.setString(4, pg.getObservaciones());
            ps.setBoolean(5, pg.getEstado());
            ps.setInt(6, pg.getCodigoCompra());
            ps.setInt(7, pg.getCodigoVenta());
            ps.setInt(8, pg.getCodigoMetodoPago());
            ps.setInt(9, pg.getCodigoEstadoPago());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public Pago listarCodigoPago(int id){
        Pago pg = new Pago();
        String sql = "Select * from pago where codigoPago ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                pg.setCodigoPago(rs.getInt(1));
                pg.setMonto(rs.getDouble(2));
                pg.setDatosValidos(rs.getString(3));
                pg.setFechaPago(rs.getDate(4));
                pg.setObservaciones(rs.getString(5));
                pg.setEstado(rs.getBoolean(6));
                pg.setCodigoCompra(rs.getInt(7));
                pg.setCodigoVenta(rs.getInt(8));
                pg.setCodigoMetodoPago(rs.getInt(9));
                pg.setCodigoEstadoPago(rs.getInt(10));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return pg;
    }
    
    //ACTUALIZAR
    public int actualizar(Pago pg){
        String sql= "Update Pago set monto = ?, datosValidos = ?, fechaPago = ?, observaciones = ?, estado = ? where codigoPago = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pg.getMonto());
            ps.setString(2, pg.getDatosValidos());
            ps.setDate(3, (Date) pg.getFechaPago());
            ps.setString(4, pg.getObservaciones());
            ps.setBoolean(5, pg.getEstado());
            ps.setInt(6, pg.getCodigoPago());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from pago where codigoPago ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}