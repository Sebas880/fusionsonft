package com.fusionsoft.api;

import com.fusionsoft.dao.UsuarioDAO;
import com.fusionsoft.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegistrarUsuario")
public class UsuarioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setDireccion(direccion);
        usuario.setTelefono(telefono);

        UsuarioDAO dao = new UsuarioDAO();
        boolean registrado = dao.registrarUsuario(usuario);

        if (registrado) {
            // Si el registro es exitoso, se pasa un mensaje de éxito
            request.setAttribute("mensaje", "¡Registro exitoso! Ahora puedes iniciar sesión.");
            // Redirige a la página de registro con el mensaje
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        } else {
            // Si el registro falla, se pasa un mensaje de error
            request.setAttribute("mensaje", "Error al registrar usuario. Intenta nuevamente.");
            // Redirige a la página de registro con el mensaje
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}
