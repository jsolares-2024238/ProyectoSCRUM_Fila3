/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Louis Xiloj 
 */
public class ServicioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        String sql = "Select * from Servicio";
        List<Servicio> listaServicio = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Servicio serv = new Servicio();
                serv.setCodigoServicio(rs.getInt(1));
                serv.setNombre(rs.getString(2));
                serv.setTipoDeServicio(rs.getString(3));
                serv.setDescripcion(rs.getString(4));
                serv.setCapacidadMaxima(rs.getInt(5));
                serv.setIncluye(rs.getString(6));
                serv.setPrecio(rs.getDouble(7));
                serv.setDuracion(rs.getString(8));
                serv.setEstado(rs.getBoolean(9));
                serv.setCodigoCompra(rs.getInt(10));
                serv.setCodigoDisponibilidad(rs.getInt(11));
                listaServicio.add(serv);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaServicio;
    }
    
    public int agregar(Servicio serv){
        String sql = "insert into servicio (nombre, tipoServicio, descripcion, capacidadMaxima, incluye, precio, duracion, estado, codigoCompra, codigoDisponibilidad) values (?,?,?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, serv.getNombre());
            ps.setString(2, serv.getTipoDeServicio());
            ps.setString(3, serv.getDescripcion());
            ps.setInt(4, serv.getCapacidadMaxima());
            ps.setString(5, serv.getIncluye());
            ps.setDouble(6, serv.getPrecio());
            ps.setString(7, serv.getDuracion());
            ps.setBoolean(8, serv.getEstado());
            ps.setInt(9, serv.getCodigoCompra());
            ps.setInt(10, serv.getCodigoDisponibilidad());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public Servicio listarCodigoServicio(int id){
        Servicio serv = new Servicio();
        String sql = "Select * from Servicio where codigoServicio ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                serv.setCodigoServicio(rs.getInt(1));
                serv.setNombre(rs.getString(2));
                serv.setTipoDeServicio(rs.getString(3));
                serv.setDescripcion(rs.getString(4));
                serv.setCapacidadMaxima(rs.getInt(5));
                serv.setIncluye(rs.getString(6));
                serv.setPrecio(rs.getDouble(7));
                serv.setDuracion(rs.getString(8));
                serv.setEstado(rs.getBoolean(9));
                serv.setCodigoCompra(rs.getInt(10));
                serv.setCodigoDisponibilidad(rs.getInt(11));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return serv;
    }
    
    public int actualizar(Servicio serv){
        String sql = "Update Servicio set nombre = ?, tipoServicio = ?, descripcion = ?, capacidadMaxima = ?, incluye = ?, precio = ?, duracion = ?, estado = ? where codigoServicio = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, serv.getNombre());
            ps.setString(2, serv.getTipoDeServicio());
            ps.setString(3, serv.getDescripcion());
            ps.setInt(4, serv.getCapacidadMaxima());
            ps.setString(5, serv.getIncluye());
            ps.setDouble(6, serv.getPrecio());
            ps.setString(7, serv.getDuracion());
            ps.setBoolean(8, serv.getEstado());
            ps.setInt(9, serv.getCodigoServicio());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "Delete from Servicio where codigoServicio ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
