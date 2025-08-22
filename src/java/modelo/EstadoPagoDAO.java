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
 * @author Diego Sebastian
 */
public class EstadoPagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        String sql = "Select * from EstadoPago";
        List<EstadoPago> listaEstadoPago = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                EstadoPago estpag = new EstadoPago();
                estpag.setCodigoEstadoPago(rs.getInt(1));
                estpag.setNotificacionEnviada(rs.getBoolean(2));
                estpag.setObservaciones(rs.getString(3));
                estpag.setFechaCambio(rs.getDate(4));
                estpag.setEstado(rs.getBoolean(5));
                listaEstadoPago.add(estpag);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaEstadoPago;
    }
    
    
    public int agregar(EstadoPago estpag){
        String sql = "Insert into EstadoPago(notificacionEnviada, observaciones, fechaCambio, estado) values(?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, estpag.getNotificacionEnviada());
            ps.setString(2, estpag.getObservaciones());
            ps.setDate(3, estpag.getFechaCambio());
            ps.setBoolean(4, estpag.getEstado());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public EstadoPago listarCodigoEstadoPago(int id){
        EstadoPago estpag = new EstadoPago();
        String sql = "Select * from EstadoPago where codigoEstadoPago = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                estpag.setCodigoEstadoPago(rs.getInt(1));
                estpag.setNotificacionEnviada(rs.getBoolean(2));
                estpag.setObservaciones(rs.getString(3));
                estpag.setFechaCambio(rs.getDate(4));
                estpag.setEstado(rs.getBoolean(5));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return estpag;
    }
    
    public int actualizar(EstadoPago estpag){
        String sql = "Update EstadoPago set notificacionEnviada = ?, observaciones = ?, fechaCambio = ?, estado = ? where codigoEstadoPago = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, estpag.getNotificacionEnviada());
            ps.setString(2, estpag.getObservaciones());
            ps.setDate(3, estpag.getFechaCambio());
            ps.setBoolean(4, estpag.getEstado());
            ps.setInt(5, estpag.getCodigoEstadoPago());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "Delete from EstadoPago where codigoEstadoPago = " +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
