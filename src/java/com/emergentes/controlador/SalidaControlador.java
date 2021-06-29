package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.SalidaDAO;
import com.emergentes.dao.SalidaDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Salida;
import com.emergentes.modelo.Venta;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SalidaControlador", urlPatterns = {"/SalidaControlador"})
public class SalidaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            SalidaDAO dao = new SalidaDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            ClienteDAO daoCliente = new ClienteDAOimpl();
            int id;
            
            List<Cliente> lista_clientes = null;
            List<Producto> lista_productos = null;
            
            Salida salida = new Salida();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            System.out.println("Opcion = "+ action);
            switch(action){
                case "add":
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("salida",salida);
                    request.getRequestDispatcher("frmsalida.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    //nombre = request.getParameter("nombre");
                    salida = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("salida",salida);
                    request.getRequestDispatcher("frmsalida.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("SalidaControlador");
                    break;
                case "view":
                    List<Salida> lista = dao.getAll();
                    request.setAttribute("salidas", lista);
                    request.getRequestDispatcher("salidas.jsp").forward(request, response);
                    break;
            }
        }catch(Exception ex){
            System.out.println("Error fatal " + ex.getMessage());
        }
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        String destino = request.getParameter("destino");
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        String fecha = request.getParameter("fecha");
        
        Salida salida = new Salida();
        
        salida.setId(id);
        salida.setProducto_id(producto_id);
        salida.setCliente_id(cliente_id);
        salida.setDestino(destino);
        salida.setNombre(nombre);
        salida.setTipo(tipo);
        salida.setFecha(convierteFecha(fecha));
        
        if(id == 0){
            // Nuevo
            SalidaDAO dao = new SalidaDAOimpl();
            try {
                dao.insert(salida);
                response.sendRedirect("SalidaControlador");
            } catch (Exception ex) {
                Logger.getLogger(SalidaControlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            //Editar
            SalidaDAO dao = new SalidaDAOimpl();
            try {
                dao.update(salida);
                response.sendRedirect("SalidaControlador");
            } catch (Exception ex) {
                Logger.getLogger(SalidaControlador.class.getName()).log(Level.SEVERE, null, ex);
            }            
        }
    }
    
    public Date convierteFecha(String fecha)
    {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(SalidaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaBD;
    }
}
