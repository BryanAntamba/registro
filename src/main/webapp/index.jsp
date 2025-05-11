<%--
    Comentario JSP: Información del archivo y metadatos de creación
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  <%-- Define el tipo de contenido como HTML con codificación UTF-8 y lenguaje Java --%>
<%@ page import="java.util.Map" %>  <%-- Importa la clase Map de java.util para usar mapas --%>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");  // Obtiene el atributo 'errores' de la petición, que contiene los errores del formulario
%>
<html lang="en">  <%-- Inicia el documento HTML con idioma inglés --%>
<head>
    <link href="<%=request.getContextPath()%>/estilo.css" rel="stylesheet"/>  <%-- Enlaza la hoja de estilos CSS desde el contexto de la aplicación --%>
    <title>Formulario usuario</title>  <%-- Título de la pestaña del navegador --%>
</head>
<body>
<img id="logotipo" src="img/neom.png">  <%-- Muestra el logotipo con la imagen especificada --%>
<h3 id="titulo">N E O M  نيوم</h3>  <%-- Título principal de la página con texto en árabe incluido --%>
<%
    if (errores != null && errores.size() > 0) {  // Si existen errores, se muestran en una lista
%>
<ul>
    <% for (String error: errores.values()) { %>  <%-- Itera sobre los valores del mapa de errores --%>
    <li><%= error %></li>  <%-- Muestra cada error en un elemento de lista --%>
    <% } %>
</ul>
<% } %>

<div>
    <form class="contenedor-registro" action="/app_formulario/registro" method="post">  <%-- Formulario principal, envía datos a la ruta especificada por POST --%>
        <div >
            <label class="subtitulos1" for="username">Usuario:</label>  <%-- Etiqueta para el campo de nombre de usuario --%>
            <div>
                <input class="insertar" type="text" name="username" id="username" placeholder="User...">  <%-- Campo de texto para el nombre de usuario --%>
            </div>
        </div>

        <div>
            <label class="subtitulos2" for="password">Password:</label>  <%-- Etiqueta para la contraseña --%>
            <div>
                <input class="insertar" type="password" name="password" id="password" placeholder="Password...">  <%-- Campo de entrada de tipo contraseña --%>
            </div>
        </div>

        <div>
            <label class="subtitulos3" for="email">Email:</label>  <%-- Etiqueta para el email --%>
            <div>
                <input class="insertar" type="email" name="email" id="email" placeholder="Email...">  <%-- Campo de entrada para el correo electrónico --%>
            </div>
        </div>

        <div>
            <label class="subtitulos4" for="pais">País:</label>  <%-- Etiqueta para la selección del país --%>
            <div>
                <select class="opciones" name="pais" id="pais">  <%-- Menú desplegable para países --%>
                    <option value="">-----Seleccionar---</option>  <%-- Opción por defecto --%>
                    <option value="ES">España</option>
                    <option value="EC">Ecuador</option>
                    <option value="PE">Perú</option>
                    <option value="CO">Colombia</option>
                    <option value="BR">Brasil</option>
                    <option value="AR">Argentina</option>
                    <option value="VE">Venezuela</option>
                </select>
            </div>
        </div>

        <div>
            <label class="subtitulos5" for="lenguajes">Lenguajes:</label>  <%-- Etiqueta para lenguajes de programación --%>
            <div>
                <select class="opciones2" name="lenguajes" id="lenguajes" multiple>  <%-- Menú múltiple de lenguajes --%>
                    <option value="">-----Seleccionar-----</option>
                    <option value="Java">Java</option>
                    <option value="Python">Python</option>
                    <option value="C#">C#</option>
                    <option value="C++">C++</option>
                    <option value="Angular">Angular</option>
                </select>
            </div>
        </div>

        <div>
            <label class="subtitulos6">Roles:</label>  <%-- Etiqueta para los roles disponibles --%>
            <div class="bloques1">  <%-- Contenedor con distribución horizontal para los checkboxes --%>
                <div>
                    <input type="checkbox" name="roles" value="ROLE_ADMIN">  <%-- Opción para rol Administrador --%>
                    <label>Administrador</label>
                </div>
                <div>
                    <input type="checkbox" name="roles" value="ROLE_USER">  <%-- Opción para rol Usuario --%>
                    <label>Usuario</label>
                </div>
                <div>
                    <input type="checkbox" name="roles" value="ROLE_MODERADOR">  <%-- Opción para rol Moderador --%>
                    <label>Moderador</label>
                </div>
            </div>
        </div>

        <div>
            <label class="subtitulos7">Idiomas:</label>  <%-- Etiqueta para idiomas disponibles --%>
            <div class="bloques2">  <%-- Contenedor con distribución horizontal para los radios --%>
                <div>
                    <input type="radio" name="idioma" value="es">  <%-- Opción Español --%>
                    <label>Español</label>
                </div>
                <div>
                    <input type="radio" name="idioma" value="en">  <%-- Opción Inglés --%>
                    <label>Inglés</label>
                </div>
                <div>
                    <input type="radio" name="idioma" value="ru">  <%-- Opción Ruso --%>
                    <label>Ruso</label>
                </div>
            </div>
        </div>

        <div>
            <label class="subtitulos8" for="habilitar">Habilitar:</label>  <%-- Etiqueta para habilitar la cuenta --%>
            <div>
                <input class="bloques3" type="checkbox" name="habilitar" id="habilitar" checked>  <%-- Checkbox marcado por defecto --%>
            </div>
        </div>

        <div id="botonEnviar">
            <input class="botonEnvio" type="submit" value="Enviar">  <%-- Botón para enviar el formulario --%>
        </div>

        <input type="hidden" name="secreto" value="123456">  <%-- Campo oculto que envía un valor secreto junto al formulario --%>
    </form>
</div>
</body>
</html>

