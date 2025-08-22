package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CompraDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //MÉTODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql ="select * from Compra";
        List<Compra> listaCompra = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Compra com = new Compra();
                com.setCodigoCompra(rs.getInt(1));
                com.setTotal(rs.getDouble(2));
                com.setObservaciones(rs.getString(3));
                com.setFechaCompra(rs.getDate(4));
                com.setEstado(rs.getBoolean(5));
                com.setCodigoProveedor(rs.getInt(6));
                listaCompra.add(com);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaCompra;
    }
    
    //AGREGAR
    public int agregar(Compra com){
        String sql = "insert into Compra (total, observaciones, fechaCompra, estado, codigoProveedor) values (?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, com.getTotal());
            ps.setString(2, com.getObservaciones());
            ps.setDate(3, com.getFechaCompra());
            ps.setBoolean(4, com.getEstado());
            ps.setInt(5, com.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //BUSCAR POR CÓDIGO
    public Compra listarCodigoCompra(int id){
        //Instanciar un objeto de tipo Compra
        Compra com = new Compra();
        String sql = "Select * from Compra where codigoCompra = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                com.setCodigoCompra(rs.getInt(1));
                com.setTotal(rs.getDouble(2));
                com.setObservaciones(rs.getString(3));
                com.setFechaCompra(rs.getDate(4));
                com.setEstado(rs.getBoolean(5));
                com.setCodigoProveedor(rs.getInt(6));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return com;
    }
    
    //ACTUALIZAR
    public int actualizar (Compra com){
        String sql = "Update Compra set total = ?, observaciones = ?, fechaCompra = ?, estado = ?, codigoProveedor = ? where codigoCompra = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps = con.prepareStatement(sql);
            ps.setDouble(1, com.getTotal());
            ps.setString(2, com.getObservaciones());
            ps.setDate(3, com.getFechaCompra());
            ps.setBoolean(4, com.getEstado());
            ps.setInt(5, com.getCodigoProveedor());
            ps.setInt(6, com.getCodigoCompra());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from Compra where codigoCompra = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
