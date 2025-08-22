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
public class DisponibilidadDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public List listar(){
        String sql = "Select * from Disponibilidad";
        List<Disponibilidad> listaDisponibilidad = new ArrayList<>();
        try{    
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Disponibilidad disp = new Disponibilidad();
                disp.setCodigoDisponibilidad(rs.getInt(1));
                disp.setCuposDisponibles(rs.getInt(2));
                disp.setFecha(rs.getDate(3));
                disp.setHoraInicio(rs.getTime(4));
                disp.setHoraFin(rs.getTime(5));
                disp.setEstado(rs.getBoolean(6));
                listaDisponibilidad.add(disp);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaDisponibilidad;
    }

    public int agregar(Disponibilidad disp){
        String sql = "insert into disponibilidad (cuposDisponibles, fecha, horaInicio, horaFin, estado) values (?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, disp.getCuposDisponibles());
            ps.setDate(2, disp.getFecha());
            ps.setTime(3, disp.getHoraInicio());
            ps.setTime(4, disp.getHoraFin());
            ps.setBoolean(5, disp.getEstado());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }

    public Disponibilidad listarCodigoDisponibilidad(int id){
        Disponibilidad disp = new Disponibilidad();
        String sql = "Select * from Disponibilidad where codigoDisponibilidad ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                disp.setCodigoDisponibilidad(rs.getInt(1));
                disp.setCuposDisponibles(rs.getInt(2));
                disp.setFecha(rs.getDate(3));
                disp.setHoraInicio(rs.getTime(4));
                disp.setHoraFin(rs.getTime(5));
                disp.setEstado(rs.getBoolean(6));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return disp;
    }

    public int actualizar(Disponibilidad disp){
        String sql = "Update Disponibilidad set cuposDisponibles = ?, fecha = ?, horaInicio = ?, horaFin = ?, estado = ? where codigoDisponibilidad = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, disp.getCuposDisponibles());
            ps.setDate(2, disp.getFecha());
            ps.setTime(3, disp.getHoraInicio());
            ps.setTime(4, disp.getHoraFin());
            ps.setBoolean(5, disp.getEstado());
            ps.setInt(6, disp.getCodigoDisponibilidad());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "Delete from Disponibilidad where codigoDisponibilidad ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }



    
}
