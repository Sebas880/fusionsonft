package com.fusionsoft.dao;

import java.sql.*;
import com.fusionsoft.model.Usuario;
import com.fusionsoft.util.DBConnection;

public class UsuarioDAO {

    public boolean registrarUsuario(Usuario usuario) {
        // 1. Validación básica
        if (usuario == null || usuario.getCorreo() == null) {
            System.err.println("❌ Error: Usuario o correo nulo");
            return false;
        }

        // 2. Query SQL
        String sql = "INSERT INTO usuarios (nombre, correo, contrasena, direccion, telefono) VALUES (?, ?, ?, ?, ?)";

        // 3. Conexión a la base de datos
        try (Connection conn = DBConnection.obtenerConexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // 4. Verificar conexión
            if (conn == null) {
                System.err.println("❌ Error: No hay conexión a la BD");
                return false;
            }

            // 5. Asignar valores a los parámetros
            pstmt.setString(1, usuario.getNombre());
            pstmt.setString(2, usuario.getCorreo());
            pstmt.setString(3, usuario.getContrasena());
            pstmt.setString(4, usuario.getDireccion());
            pstmt.setString(5, usuario.getTelefono());

            // 6. Ejecutar inserción
            int filasAfectadas = pstmt.executeUpdate();
            System.out.println("✅ Filas afectadas: " + filasAfectadas);

            return filasAfectadas > 0;

        } catch (SQLException e) {
            System.err.println("🚨 Error SQL:");
            System.err.println("- Mensaje: " + e.getMessage());
            System.err.println("- Código: " + e.getErrorCode());
            System.err.println("- Estado SQL: " + e.getSQLState());
            return false;
        }
    }
}