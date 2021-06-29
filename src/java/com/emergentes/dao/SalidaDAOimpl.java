package com.emergentes.dao;

import com.emergentes.modelo.Salida;
import com.emergentes.modelo.Venta;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SalidaDAOimpl extends ConexionDB implements SalidaDAO {

    @Override
    public void insert(Salida salida) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO salidas (producto_id, cliente_id, destino, nombre, tipo, fecha) values (?,?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ps.setInt(1, salida.getProducto_id());
            ps.setInt(2, salida.getCliente_id());
            ps.setString(3, salida.getDestino());
            ps.setString(4, salida.getNombre());
            ps.setString(5, salida.getTipo());
            ps.setDate(6, salida.getFecha());
            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Salida salida) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE salidas SET producto_id = ?, cliente_id = ?, destino = ?, nombre = ?, tipo =?, fecha = ? WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ps.setInt(1, salida.getProducto_id());
            ps.setInt(2, salida.getCliente_id());
            ps.setString(3, salida.getDestino());
            ps.setString(4, salida.getNombre());
            ps.setString(5, salida.getTipo());
            ps.setDate(6, salida.getFecha());
            ps.setInt(7, salida.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM salidas WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Salida getById(int id) throws Exception {
        Salida s = new Salida();
        try {
            this.conectar();
            String sql = "SELECT * FROM salidas WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setProducto_id(rs.getInt("producto_id"));
                s.setCliente_id(rs.getInt("cliente_id"));
                s.setDestino(rs.getString("destino"));
                s.setNombre(rs.getString("nombre"));
                s.setTipo(rs.getString("tipo"));
                s.setFecha(rs.getDate("fecha"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return s;
    }

    @Override
    public List<Salida> getAll() throws Exception {
        List<Salida> lista = null;
        try {
            this.conectar();
            String sql = "SELECT s.*,p.nombre as producto, c.nombre as cliente FROM salidas s ";
            sql += "LEFT JOIN productos p ON s.producto_id = p.id ";
            sql += "LEFT JOIN clientes c ON s.cliente_id = c.id";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Salida>();
            while (rs.next()) {
                Salida s = new Salida();
                s.setId(rs.getInt("id"));
                
                s.setProducto_id(rs.getInt("producto_id"));
                s.setCliente_id(rs.getInt("cliente_id"));
                s.setDestino(rs.getString("destino"));
                s.setNombre(rs.getString("nombre"));
                s.setTipo(rs.getString("tipo"));
                s.setFecha(rs.getDate("fecha"));
                s.setCliente(rs.getString("cliente"));
                s.setProducto(rs.getString("producto"));
                lista.add(s);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
}
