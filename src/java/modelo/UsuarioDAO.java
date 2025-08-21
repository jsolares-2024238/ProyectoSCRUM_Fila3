package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public Usuario validar(String nombreUsuario, String contrasenia){
        Usuario usuario = new Usuario();
        String sql = "select * from Usuario where nombreUsuario = ? and contrasenia = ?";
        try{
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, nombreUsuario);
        ps.setString(2, contrasenia);
        rs = ps.executeQuery();
        while(rs.next()){
            usuario.setCodigoUsuario(rs.getInt("codigoUsuario"));
            usuario.setContrasenia(rs.getString("contrasenia"));
            usuario.setNombreUsuario(rs.getString("nombreUsuario"));
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        return usuario;
    }
    
    //METODOS DEL CRUD
    //LISTAR
    public List listar(){
        String sql="select * from Usuario";
        List<Usuario> listaUsuario = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario us = new Usuario();
                us.setCodigoUsuario(rs.getInt(1));
                us.setNombreUsuario(rs.getString(2));
                us.setContrasenia(rs.getString(3));
                us.setRol(rs.getString(4));
                us.setEstado(rs.getBoolean(5));
                us.setCodigoCliente(rs.getInt(6));
                listaUsuario.add(us);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaUsuario;
    }
    
    //AGREGAR
    public int agregar(Usuario use){
        String sql = "insert into Usuario (nombreUsuario, contrasenia, rol, estado, codigoCliente) values(?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, use.getNombreUsuario());
            ps.setString(2, use.getContrasenia());
            ps.setString(3, use.getRol());
            ps.setBoolean(4, use.getEstado());
            ps.setInt(5, use.getCodigoCliente());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //BUSCAR POR CODIGO
    public Usuario listarCodigoUsuario(int id){
        Usuario user = new Usuario();
        String sql = "Select * from Usuario where Usuario = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                user.setCodigoUsuario(rs.getInt(1));
                user.setNombreUsuario(rs.getString(2));
                user.setContrasenia(rs.getString(3));
                user.setRol(rs.getString(4));
                user.setEstado(rs.getBoolean(5));
                user.setCodigoCliente(rs.getInt(6));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    //ACTUALIZAR
    public int actualizar(Usuario user){
        String sql= "Update Usuario set nombreUsuario=?, contrasenia=?, rol=?, estado=? where codigoUsuario = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getNombreUsuario());
            ps.setString(2, user.getContrasenia());
            ps.setString(3, user.getRol());
            ps.setBoolean(4, user.getEstado());
            ps.setInt(5, user.getCodigoUsuario());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //ELIMINAR
    public void eliminar(int id){
        String sql = "Delete from Usuario where codigoUsuario = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
