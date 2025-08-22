package modelo;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MetodoPagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<MetodoPago> listar() {
        List<MetodoPago> lista = new ArrayList<>();
        String sql = "SELECT * FROM MetodoPago";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                MetodoPago mp = new MetodoPago();
                mp.setCodigoMetodoPago(rs.getInt("codigoMetodoPago"));
                mp.setNombre(rs.getString("nombre"));
                mp.setDescripcion(rs.getString("descripcion"));
                mp.setComision(rs.getDouble("comision"));
                mp.setTipo(rs.getString("tipo"));
                mp.setEstado(rs.getBoolean("estado"));
                lista.add(mp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public MetodoPago listarCodigoMetodoPago(int id) {
        MetodoPago mp = new MetodoPago();
        String sql = "SELECT * FROM MetodoPago WHERE codigoMetodoPago=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                mp.setCodigoMetodoPago(rs.getInt("codigoMetodoPago"));
                mp.setNombre(rs.getString("nombre"));
                mp.setDescripcion(rs.getString("descripcion"));
                mp.setComision(rs.getDouble("comision"));
                mp.setTipo(rs.getString("tipo"));
                mp.setEstado(rs.getBoolean("estado"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mp;
    }

    public boolean agregar(MetodoPago mp) {
        String sql = "INSERT INTO MetodoPago(nombre, descripcion, comision, tipo, estado) VALUES (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mp.getNombre());
            ps.setString(2, mp.getDescripcion());
            ps.setDouble(3, mp.getComision());
            ps.setString(4, mp.getTipo());
            ps.setBoolean(5, mp.isEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean actualizar(MetodoPago mp) {
        String sql = "UPDATE MetodoPago SET nombre=?, descripcion=?, comision=?, tipo=?, estado=? WHERE codigoMetodoPago=?";
        try {
           con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, mp.getNombre());
            ps.setString(2, mp.getDescripcion());
            ps.setDouble(3, mp.getComision());
            ps.setString(4, mp.getTipo());
            ps.setBoolean(5, mp.isEstado());
            ps.setInt(6, mp.getCodigoMetodoPago());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM MetodoPago WHERE codigoMetodoPago=" + id;
        try {
          con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}






