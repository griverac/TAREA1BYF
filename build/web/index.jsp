<%-- 
    Document   : index
    Created on : 15/10/2022, 10:27:10
    Author     : sebas
--%>
<%@page import ="apis.api_cliente" %>
<%@page import ="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
       <div class="container">
            <form action="empleado_sr" method="post" class="form-group was-validated">
                <fieldset class="container p-3 my-3 border">
                    <h2 class=" text-center">FORMULARIO</h2>
                    <label for="lbl_id" class=" col-form-label-lg"><b>ID:</b></label>
                    <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>
                    <label for="lbl_nombres" class=" col-form-label-lg"><b>Nombres:</b></label>
                    <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 y Nombre 2" required>
                    <label for="lbl_apellidos" class=" col-form-label-lg"><b>Apellidos:</b></label>
                    <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 y Apellido 2" required>
                    <label for="lbl_direccion" class=" col-form-label-lg"><b>Direccion:</b></label>
                    <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: No. Casa, Calle, Zona, Ciudad" required>
                    <label for="lbl_telefono" class=" col-form-label-lg"><b>Telefono:</b></label>
                    <input type="tel" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 0000-0000" required>
                    <label for="lbl_dpi" class=" col-form-label-lg"><b>DPI:</b></label>
                    <input type="text" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="123456789" required>
                    <br>
                    <label for="lbl_genero" class=" col-form-label-lg"><b>Género:    </b></label>
                    <select name="genero">
                        <option value="Hombre">Hombre</option>
                        <option value="Mujer">Mujer</option>

                    </select>
                    <br>
                    <label for="lbl_fn" class=" col-form-label-lg"><b>Fecha de Nacimiento:</b></label>
                    <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                     <label for="lbl_fn" class=" col-form-label-lg"><b>Fecha de Ingreso:</b></label>
                    <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                    <label for="lbl_puesto" class=" col-form-label-lg"><b>Puesto:</b></label>
                    <select id="drop_puesto" class="form-control" name="drop_puesto">
                        <%
                            Empleado puesto = new Empleado();
                            HashMap<String, String> drop = empleado.drop_puesto();
                            for (String i : drop.keySet()) {
                                out.println("<option value=" + i + ">" + drop.get(i) + "</option>");
                            }
                        %>

                    </select>

                    <label for="lbl_fil" class=" col-form-label-lg" ><b>Fecha de Inicio de Labores:</b></label>
                    <input type="date" name="txt_fil" id="txt_fil" class="form-control" required>
                    <label for="lbl_ingre" class=" col-form-label-lg"><b>Fecha de Ingreso:</b></label>
                    <input type="date" name="txt_ingre" id="txt_ingre" class="form-control" required>
                </fieldset>

                <br>
                <fieldset  class="container p-5 my-5 border">
                    <div class="row justify-content-around ">
                        <div class="">
                            <button name="btn_agregar" id="btn_agregar"  class="btn btn-success btn-lg" value="agregar"><b>Agregar</b></button>
                        </div>
                        <div class="">
                            <button name="btn_modificar" id="btn_modificar"  class="btn btn-warning btn-lg" value="modificar"><b>Modificar</b></button>
                        </div>
                        <div class="">
                            <button name="btn_eliminar" id="btn_eliminar"  class="btn btn-danger btn-lg" value="eliminar")
                                        return false"><b>Eliminar</b></button>
                        </div>
                    </div>
                </fieldset>
            </form>
            <br>
            <br>
            <br>
            <h2 class=" text-center">TABLA   DE DATOS </h2>
            <br>
            <table class="table table-striped table-bordered table-sm text-center">
                <thead class="table-primary">
                    <tr>

                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>DPI</th>
                        <th>Genero</th>
                        <th>Fecha de Nacimiento</th> 
                        <th>Fecha Ingreso</th>
                        <th>Puesto</th>

                    </tr>
                </thead>
                <tbody id="tbl_empleados" >
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 11) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 9) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 10) + "</td>");

                            out.println("</tr>");

                        }

                    %>


                </tbody>
            </table>

        </div>


      
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

