package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DetalleCompraDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    
    //MÉTODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql ="select * from DetalleCompra";
        List<DetalleCompra> listaDetalleCompra = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                DetalleCompra detCom = new DetalleCompra();
                detCom.setCodigoDetalleCompra(rs.getInt(1));
                detCom.setObservaciones(rs.getString(2));
                detCom.setFechaServicio(rs.getDate(3));
                detCom.setPrecioUnitario(rs.getDouble(4));
                detCom.setCantidad(rs.getInt(5));
                detCom.setCodigoCompra(rs.getInt(6));
                detCom.setCodigoProveedor(rs.getInt(7));
                listaDetalleCompra.add(detCom);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaDetalleCompra;
    }
    
    //AGREGAR
    public int agregar(DetalleCompra detCom){
        String sql = "insert into DetalleCompra (observaciones, fechaServicio, precioUnitario, cantidad, codigoCompra, codigoProveedor) values (?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, detCom.getObservaciones());
            ps.setDate(2, detCom.getFechaServicio());
            ps.setDouble(3, detCom.getPrecioUnitario());
            ps.setInt(4, detCom.getCantidad());
            ps.setInt(5, detCom.getCodigoCompra());
            ps.setInt(6, detCom.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //BUSCAR POR CÓDIGO
    public DetalleCompra listarCodigoDetalleCompra(int id){
        //Instanciar un objeto de tipo DetalleCompra
        DetalleCompra detCom = new DetalleCompra();
        String sql = "Select * from DetalleCompra where codigoDetalleCompra = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                detCom.setCodigoDetalleCompra(rs.getInt(1));
                detCom.setObservaciones(rs.getString(2));
                detCom.setFechaServicio(rs.getDate(3));
                detCom.setPrecioUnitario(rs.getInt(4));
                detCom.setCantidad(rs.getInt(5));
                detCom.setCodigoCompra(rs.getInt(6));
                detCom.setCodigoProveedor(rs.getInt(7));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return detCom;
    }
    
    //ACTUALIZAR
    public int actualizar (DetalleCompra detCom){
        String sql = "Update DetalleCompra set observaciones = ?, fechaServicio = ?, precioUnitario = ?, cantidad = ? where codigoDetalleCompra = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps = con.prepareStatement(sql);
            ps.setString(1, detCom.getObservaciones());
            ps.setDate(2, detCom.getFechaServicio());
            ps.setDouble(3, detCom.getPrecioUnitario());
            ps.setInt(4, detCom.getCantidad());
            ps.setInt(5, detCom.getCodigoDetalleCompra());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from DetalleCompra where codigoDetalleCompra = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
}
