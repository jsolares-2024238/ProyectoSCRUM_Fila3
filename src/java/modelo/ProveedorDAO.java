package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Molina
 */
public class ProveedorDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql="select * from Proveedor";
        List<Proveedor> listaProveedor = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Proveedor pv = new Proveedor();
                pv.setCodigoProveedor(rs.getInt(1));
                pv.setNombreEmpresa(rs.getString(2));
                pv.setDescripcionServicios(rs.getString(3));
                pv.setTelefono(rs.getString(4));
                pv.setDireccion(rs.getString(5));
                pv.setEmail(rs.getString(6));
                pv.setCalificacionPromedio(rs.getDouble(7));
                listaProveedor.add(pv);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaProveedor;
    }
    
    //AGREGAR
    public int agregar(Proveedor prov){
        String sql = "insert into Proveedor(nombreEmpresa, descripcionServicios, telefono, direccion, email, calificacionPromedio) values(?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombreEmpresa());
            ps.setString(2, prov.getDescripcionServicios());
            ps.setString(3, prov.getTelefono());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEmail());
            ps.setDouble(6, prov.getCalificacionPromedio());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public Proveedor listarCodigoProveedor(int id){
        Proveedor prov = new Proveedor();
        String sql = "Select * from Proveedor where codigoProveedor = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                prov.setCodigoProveedor(rs.getInt(1));
                prov.setNombreEmpresa(rs.getString(2));
                prov.setDescripcionServicios(rs.getString(3));
                prov.setTelefono(rs.getString(4));
                prov.setDireccion(rs.getString(5));
                prov.setEmail(rs.getString(6));
                prov.setCalificacionPromedio(rs.getDouble(7));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return prov;
    }
    
    //ACTUALIZAR
    public int actualizar(Proveedor prov){
        String sql= "Update Proveedor set nombreEmpresa=?, descripcionServicios=?, telefono=?, direccion=?, email=?, calificacionPromedio=? where codigoProveedor = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombreEmpresa());
            ps.setString(2, prov.getDescripcionServicios());
            ps.setString(3, prov.getTelefono());
            ps.setString(4, prov.getDireccion());
            ps.setString(5, prov.getEmail());
            ps.setDouble(6, prov.getCalificacionPromedio());
            ps.setInt(7, prov.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "Delete from Proveedor where codigoProveedor = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
