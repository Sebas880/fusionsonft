package com.fusionsoft.test;

import com.fusionsoft.dao.UsuarioDAO;
import com.fusionsoft.model.Usuario;
import com.fusionsoft.util.DBConnection;
import java.sql.Connection;

public class TestRegistro {
    public static void main(String[] args) {
        // 1. Verificar conexión
        System.out.println("=== TEST DE CONEXIÓN ===");
        try (Connection conn = DBConnection.obtenerConexion()) {
            System.out.println(conn != null ? "✅ Conexión exitosa" : "❌ Conexión fallida");
        } catch (Exception e) {
            System.err.println("🚨 Error en conexión: " + e.getMessage());
        }

        // 2. Test de registro
        System.out.println("\n=== TEST DE REGISTRO ===");
        Usuario testUser = new Usuario();
        testUser.setNombre("Usuario Test");
        testUser.setCorreo("test_" + System.currentTimeMillis() + "@test.com"); // Correo único
        testUser.setContrasena("123456");
        testUser.setDireccion("Calle Test 123");
        testUser.setTelefono("1234567890");

        boolean resultado = new UsuarioDAO().registrarUsuario(testUser);
        System.out.println(resultado ? "✅ Registro exitoso" : "❌ Registro fallido");

        // 3. Verificar en MySQL
        System.out.println("\n=== INSTRUCCIÓN PARA VERIFICAR EN MYSQL ===");
        System.out.println("Ejecuta en MySQL Workbench: \nSELECT * FROM usuarios WHERE correo LIKE '%test_%';");
    }
}