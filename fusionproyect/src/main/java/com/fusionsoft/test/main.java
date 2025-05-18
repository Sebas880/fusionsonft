package com.fusionsoft.test;

import java.sql.Connection;
import com.fusionsoft.util.DBConnection;

public class main {
    public static void main(String[] args) {
        Connection conn = DBConnection.obtenerConexion();
        
        if (conn != null) {
            System.out.println("✅ Conexión exitosa a la base de datos.");
        } else {
            System.out.println("❌ Falló la conexión.");
        }
    }
}
