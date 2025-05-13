/*Desarrollador: Bryan Antamba
* Fecha: 12/05/2025
* Descripcion: Desarrollo de clase Servlet, desarrollo de atributos de formulario, condicionales de errores
* al no llenar los campos solicitados del index.jsp con su generacion respectiva*/
package org.bryan.appformulario;  // Define el paquete al que pertenece la clase

import jakarta.servlet.ServletException;  // Importa la clase para manejar excepciones de servlets
import jakarta.servlet.annotation.WebServlet;  // Permite usar anotaciones para definir servlets
import jakarta.servlet.http.HttpServlet;  // Clase base para crear servlets HTTP
import jakarta.servlet.http.HttpServletRequest;  // Proporciona datos de la solicitud HTTP
import jakarta.servlet.http.HttpServletResponse;  // Proporciona la respuesta HTTP

import java.io.IOException;  // Manejo de excepciones de entrada/salida
import java.io.PrintWriter;  // Permite imprimir texto en la respuesta
import java.util.Arrays;  // Utilidad para trabajar con arrays
import java.util.HashMap;  // Implementación de Map para almacenar pares clave-valor
import java.util.Map;  // Interfaz para mapas de clave-valor

// Define la ruta del servlet
@WebServlet("/registro")  // El servlet se activa cuando se accede a /registro
public class Servlet extends HttpServlet {  // Clase que extiende HttpServlet

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {  // Método que maneja solicitudes POST

        resp.setContentType("text/html");  // Define que la respuesta será HTML

        // Obtenemos los atributos enviados desde el formulario
        String username = req.getParameter("username");  // Nombre de usuario
        String password = req.getParameter("password");  // Contraseña
        String[] roles = req.getParameterValues("roles");  // Roles seleccionados (pueden ser múltiples)
        String email = req.getParameter("email");  // Email
        String pais = req.getParameter("pais");  // País seleccionado
        String[] lenguajes = req.getParameterValues("lenguajes");  // Lenguajes seleccionados
        String idioma = req.getParameter("idioma");  // Idioma elegido
        boolean habilitar = req.getParameter("habilitar") != null &&
                req.getParameter("habilitar").equals("on");  // Verifica si el checkbox "habilitar" está activo
        String secreto = req.getParameter("secreto");  // Valor oculto del formulario

        Map<String, String> errores = new HashMap<>();  // Mapa para almacenar mensajes de error

        // Validaciones de campos obligatorios
        if (username == null || username.isBlank()) {
            errores.put("username", "El usuario es obligatorio");  // Verifica campo username
        }

        if (password == null || password.isBlank()) {
            errores.put("password", "El password es obligatorio");  // Verifica campo password
        }

        if (email == null || !email.contains("@")) {
            errores.put("email", "El email es obligatorio y debe tener un formato de correo.");  // Valida el email
        }

        if (pais == null || pais.trim().isEmpty()) {
            errores.put("pais", "El pais es requerido!");  // Verifica selección de país
        }

        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes", "Debe seleccionar al menos una opción");  // Requiere al menos un lenguaje
        }

        if (roles == null || roles.length == 0) {
            errores.put("roles", "Debe seleccionar al menos un rol");  // Requiere al menos un rol
        }

        if (idioma == null) {
            errores.put("idioma", "Debe seleccionar un idioma!");  // Verifica si se seleccionó un idioma
        }

        if (errores.isEmpty()) {  // Si no hay errores, genera la respuesta de éxito
            try (PrintWriter out = resp.getWriter()) {  // Abre el PrintWriter para escribir en la respuesta
                out.println("<!DOCTYPE html>");  // Inicio del documento HTML
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");  // Establece la codificación
                out.println("<title>Resultado form</title>");  // Título de la página
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Resultado form!</h1>");  // Encabezado
                out.println("<ul>");
                out.println("<li>Username: " + username + "</li>");  // Muestra el username
                out.println("<li>Password: " + password + "</li>");  // Muestra la contraseña
                out.println("<li>Email: " + email + "</li>");  // Muestra el email
                out.println("<li>País: " + pais + "</li>");  // Muestra el país
                out.println("<li>Lenguajes: <ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {  // Itera sobre los lenguajes
                    out.println("<li>" + lenguaje + "</li>");  // Muestra cada lenguaje
                });
                out.println("</ul></li>");
                out.println("<li>Roles: <ul>");
                Arrays.asList(roles).forEach(role -> {  // Itera sobre los roles
                    out.println("<li>" + role + "</li>");  // Muestra cada rol
                });
                out.println("</ul></li>");
                out.println("<li>Idioma: " + idioma + "</li>");  // Muestra el idioma seleccionado
                out.println("<li>Habilitado: " + habilitar + "</li>");  // Indica si está habilitado
                out.println("<li>Secreto: " + secreto + "</li>");  // Muestra el valor del campo oculto
                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);  // Pasa los errores como atributo
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);  // Redirige de nuevo al formulario con errores
        }
    }
}

