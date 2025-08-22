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
 * @author Christian
 */
public class DestinoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    // LISTAR DESTINO
    public List listar(){
        String sql ="select * from Destino";
        List<Destino> listaDestino = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Destino de = new Destino();
                de.setCodigoDestino(rs.getInt(1));
                de.setNombre(rs.getString(2));
                de.setDescripcion(rs.getString(3));
                de.setPais(rs.getString(4));
                de.setCiudad(rs.getString(5));
                de.setInformacionTuristica(rs.getString(6));
                de.setClima(rs.getString(7));
                de.setMejorEpocaVisita(rs.getString(8));
                de.setEstado(rs.getBoolean(9));
                de.setCodigoServicio(rs.getInt(10));
                listaDestino.add(de);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaDestino;
    }
    
    // AGREGAR DESTINO 
    public int agregar(Destino des){
        String sql = "insert into destino (nombre, descripcion, pais, ciudad, informacionTuristica, clima, mejorEpocaVisita, estado, codigoServicio) values(?,?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, des.getNombre());
            ps.setString(2, des.getDescripcion());
            ps.setString(3, des.getPais());
            ps.setString(4, des.getCiudad());
            ps.setString(5, des.getInformacionTuristica());
            ps.setString(6, des.getClima());
            ps.setString(7, des.getMejorEpocaVisita());
            ps.setBoolean(8, des.getEstado());
            ps.setInt(9, des.getCodigoServicio());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    // BUSCAR DESTINO
    public Destino listarCodigoDestino(int id){
        
        Destino des = new Destino();
        String sql = "Select * from Destino where codigoDestino ="+id;
        try{
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           while(rs.next()){
               des.setCodigoDestino(rs.getInt(1));
               des.setNombre(rs.getString(2));
               des.setDescripcion(rs.getString(3));
               des.setPais(rs.getString(4));
               des.setCiudad(rs.getString(5));
               des.setInformacionTuristica(rs.getString(6));
               des.setClima(rs.getString(7));
               des.setMejorEpocaVisita(rs.getString(8));
               des.setEstado(rs.getBoolean(9));
               des.setCodigoServicio(rs.getInt(10));
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        return des;
        
    }
        
    // ACTUALIZAR DESTINO
    public int actualizar(Destino des){
        String sql = "Update Destino set nombre = ?, descripcion = ?, pais = ?, ciudad = ?, informacionTuristica = ?, clima = ?, mejorEpocaVisita = ?, estado = ? where codigoDestino = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, des.getNombre());
            ps.setString(2, des.getDescripcion());
            ps.setString(3, des.getPais());
            ps.setString(4, des.getCiudad());
            ps.setString(5, des.getInformacionTuristica());
            ps.setString(6, des.getClima());
            ps.setString(7, des.getMejorEpocaVisita());
            ps.setBoolean(8, des.getEstado());
            ps.setInt(9, des.getCodigoDestino());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    //ELIMINAR DESTINO   
    public void eliminar(int id){
        String sql = "Delete from Destino where codigoDestino ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
     } 
}
