package com.emergentes.dao;

import com.emergentes.modelo.Salida;
import java.util.List;

public interface SalidaDAO {
    public void insert(Salida salida) throws Exception;
    public void update(Salida salida) throws Exception;
    public void delete(int id) throws Exception;
    public Salida getById(int id) throws Exception;
    public List<Salida> getAll() throws Exception;       
}
