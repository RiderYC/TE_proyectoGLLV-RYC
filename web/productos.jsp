<%
    if (session.getAttribute("login") != "OK"){
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" >
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

        <title>SIGECO</title>
        <style>
            body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #B0C4DE;
            }
        </style>
        
    </head>
    <body>
        <div class="container">
            <h1><i class="fas fa-sitemap"></i> Areas</h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="productos" />
            </jsp:include>
            <br>
            <a href="#" class="btn btn-primary btn-sm"><i class="fas fa-plus-circle"></i> Nuevo </a>
            <a href="#" class="btn btn-primary btn-sm"><i class="fas fa-file-import"></i> Exportar </a>
            <a href="#" class="btn btn-primary btn-sm"><i class="fas fa-file-upload"></i> Enviar </a>
            <a href="Logout" class="btn btn-danger"><i class="fas fa-times-circle"></i></a>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Encargado</th>
                    <th>Codigo</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Direccion</td>
                    <td>Ing. Juan Mamani </td>
                    <td>0001</td>
                    <td><a href="#"><i class="fas fa-file-upload"></i></a></td>
                    <td><a href="#"><i class="fas fa-edit"></i></a></td>
                    <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Recursos Humanos</td>
                    <td>Lic. Juan Rodrigues</td>
                    <td>0002</td>
                    <td><a href="#"><i class="fas fa-file-upload"></i></a></td>
                    <td><a href="#"><i class="fas fa-edit"></i></a></td>
                    <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Producion</td>
                    <td>Lic. Marco Torrez</td>
                    <td>0003</td>
                    <td><a href="#"><i class="fas fa-file-upload"></i></a></td>
                    <td><a href="#"><i class="fas fa-edit"></i></a></td>
                    <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Finanzas o Contabilidad</td>
                    <td>Lic. Deisi Condori</td>
                    <td>0004</td>
                    <td><a href="#"><i class="fas fa-file-upload"></i></a></td>
                    <td><a href="#"><i class="fas fa-edit"></i></a></td>
                    <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Marquetin y Ventas</td>
                    <td>Ing. Arturo Lopez</td>
                    <td>0005</td>
                    <td><a href="#"><i class="fas fa-file-upload"></i></a></td>
                    <td><a href="#"><i class="fas fa-edit"></i></a></td>
                    <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                </tr>   
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

    </body>
</html>
