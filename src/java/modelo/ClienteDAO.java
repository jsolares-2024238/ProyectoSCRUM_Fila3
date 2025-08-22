
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO {
     Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
       //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql="select * from cliente";
        List<Cliente> listaCliente = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Cliente clt = new Cliente();
                clt.setCodigoCliente(rs.getInt(1));
                clt.setNombre(rs.getString(2));
                clt.setApellido(rs.getString(3));
                clt.setTelefono(rs.getString(4));
                clt.setEmail(rs.getString(5));
                clt.setDireccion(rs.getString(6));
                clt.setFechaRegistro(rs.getDate(7));
                clt.setEstado(rs.getBoolean(8));
                listaCliente.add(clt);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaCliente;
    }
    
    //AGREGAR
    public int agregar(Cliente clt){
        String sql = "insert into Cliente(nombre, apellido, telefono, email, direccion, fechaRegistro, estado) values(?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, clt.getNombre());
            ps.setString(2, clt.getApellido());
            ps.setString(3, clt.getTelefono());
            ps.setString(4, clt.getEmail());
            ps.setString(5, clt.getDireccion());
            ps.setDate(6, clt.getFechaRegistro());
            ps.setBoolean(7, clt.getEstado());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public Cliente listarCodigoCliente(int id){
        //Intanciar un objeto de tipo empleado
        Cliente clt = new Cliente();
        String sql = "Select * from Cliente where codigoCliente ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                clt.setCodigoCliente(rs.getInt(1));
                clt.setNombre(rs.getString(2));
                clt.setApellido(rs.getString(3));
                clt.setTelefono(rs.getString(4));
                clt.setEmail(rs.getString(5));
                clt.setDireccion(rs.getString(6));
                clt.setFechaRegistro(rs.getDate(7));
                clt.setEstado(rs.getBoolean(8));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return clt;
    }
    
    
    //ACTUALIZAR
    public int actualizar(Cliente clt){
        String sql= "Update Cliente set nombre =?, apellido =?, telefono =?, email =?, direccion =?, fechaRegistro=?, estado=? where codigoCliente = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, clt.getNombre());
            ps.setString(2, clt.getApellido());
            ps.setString(3, clt.getTelefono());
            ps.setString(4, clt.getEmail());
            ps.setString(5, clt.getDireccion());
            ps.setDate(6, clt.getFechaRegistro());
            ps.setBoolean(7, clt.getEstado());
            ps.setInt(8, clt.getCodigoCliente());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "delete from Cliente where codigoCliente ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
